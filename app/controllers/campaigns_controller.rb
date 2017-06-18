class CampaignsController < ApplicationController
  def show
    @campaign = CampaignPresenter.new(find_campaign)
  end

  def receipt
    id = params.dig("billplz", "id")

    @payment = UpdatePaymentStatusJob.new.perform id
    @payment = PaymentPresenter.new(@payment)
  end

  private

  def find_campaign
    Campaign.find_by(slug: params[:id])
  end
end
