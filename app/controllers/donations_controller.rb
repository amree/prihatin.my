class DonationsController < ApplicationController
  def new
    @campaign = find_campaign_by_slug
    @preview = init_preview
    @donation = DonationForm.new
  end

  def create
    @campaign = find_campaign_by_id
    @donation = DonationForm.new(donation_params)
    @donation.campaign_id = @campaign.id
    @donation.user_id = current_user&.id

    if @donation.save
      redirect_to @donation.payment_url
    else
      @preview = init_preview

      render :new
    end
  end

  private

  def init_preview
    PreviewPresenter.new(DonationPresenter.new(NullDonation.new))
  end

  def find_campaign_by_slug
    Campaign.find_by(slug: params[:campaign_id])
  end

  def find_campaign_by_id
    Campaign.find(params[:campaign_id])
  end

  def donation_params
    params.
      require(:donation).
      permit(
        :donation_amount,
        :website_amount,
        :custom_donation_amount,
        :custom_donation_amount_flag
      )
  end
end
