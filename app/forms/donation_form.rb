class DonationForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include Rails.application.routes.url_helpers

  attr_accessor(
    :donation_amount,
    :website_amount,
    :campaign_id,
    :payment_url
  )

  validates :donation_amount, presence: true
  validates :website_amount, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Donation")
  end

  def total_amount
    @total_amount ||=
      BigDecimal(donation_amount) + BigDecimal(website_amount)
  end

  def save
    if valid? && donation.persisted? && bill.present? 
      update_payment

      self.payment_url = bill.url
    else
      # TODO: Set error for bill if exists
      # TODO: Set error for donation if exists

      false
    end
  end

  private

  def campaign
    @campaign ||= Campaign.find(campaign_id)
  end

  def bill
    @bill ||=
      begin
        Billplz::Bill.create(
          collection_id: "t0gjvkkt",
          email: "hello@derma.asia",
          name: "Campaign's Organizer Name",
          amount: (total_amount * 100).to_s,
          callback_url: callback_url,
          redirect_url: redirect_url,
          description: "Campaign description"
        )
      rescue Flexirest::HTTPClientException, Flexirest::HTTPServerException => e
        nil
      end
  end

  def donation
    @donation ||=
      Donation.new.tap do |d|
        d.assign_attributes(
          campaign_id: campaign.id,
          donation_amount: donation_amount,
          website_amount: website_amount
        )
        d.build_payment(amount: total_amount)
        d.save
      end
  end

  def update_payment
    donation.payment.update(
      gateway_reference: bill.id,
      state: "due"
    )
  end

  def redirect_url
    [
      ENV.fetch("PUBLIC_URL"),
      receipt_campaign_path(campaign)
    ].join("")
  end

  def callback_url
    [
      ENV.fetch("PUBLIC_URL"),
      callbacks_path
    ].join("")
  end
end
