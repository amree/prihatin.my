class CampaignsController < ApplicationController
  def show
    @campaign = find_campaign
  end

  def receipt
    id = params.dig("billplz", "id")

    @payment = UpdatePaymentStatusJob.new.perform id
    @payment = PaymentPresenter.new(@payment)
  end

  private

  def find_campaign
    Campaign.find params[:id]
  end
end
