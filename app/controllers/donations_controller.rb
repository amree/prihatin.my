class DonationsController < ApplicationController
  def new
    @campaign = find_campaign
    @donation = DonationForm.new
  end

  def create
    @campaign = find_campaign
    @donation = DonationForm.new(donation_params)
    @donation.campaign_id = @campaign.id

    if @donation.save
      redirect_to @donation.payment_url
    else
      render :new
    end
  end

  private

  def find_campaign
    Campaign.find params[:campaign_id]
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
