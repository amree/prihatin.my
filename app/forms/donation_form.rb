class DonationForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include Rails.application.routes.url_helpers

  attr_accessor(
    :custom_donation_amount,
    :custom_donation_amount_flag,
    :donation_amount,
    :website_amount,
    :campaign_id,
    :user_id,
    :payment_url
  )

  validates :donation_amount,
    presence: true,
    format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
    numericality: { greater_than_or_equal_to: 2 }

  before_validation :set_default_value_for_website_amount
  before_validation :set_value_for_donation_amount

  def self.model_name
    ActiveModel::Name.new(self, nil, "Donation")
  end

  def set_default_value_for_website_amount
    self.website_amount = 0 if website_amount.blank?
  end

  def set_value_for_donation_amount
    if custom_donation_amount_flag == "true"
      self.donation_amount = custom_donation_amount
    end

    self.donation_amount = 0 if donation_amount.blank?
  end

  def total_amount
    @total_amount ||=
      BigDecimal(donation_amount) + BigDecimal(website_amount)
  end

  def net_donation_amount
    BigDecimal(donation_amount) - Payment::BILLPLZ_FEE
  end

  def save
    if valid? && donation.persisted? && bill.present? 
      update_payment

      self.payment_url = bill.url
    else
      set_errors

      false
    end
  end

  def set_errors
    if bill.blank?
      errors.add(
        :base,
        "There's a problem with the payment gateway. Please try again."
      )
    end

    if donation.new_record?
      donation.errors.full_messages do |error_message|
        errors.add(
          :base,
          error_message
        )
      end
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
          user_id: user_id,
          campaign_id: campaign.id,
          donation_amount: net_donation_amount,
          website_amount: website_amount,
          gateway_fee: Payment::BILLPLZ_FEE
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
