class CampaignsController < ApplicationController
  def show
    @campaign = CampaignPresenter.new(find_campaign)
  end

  private

  def find_campaign
    Campaign.find_by(slug: params[:id])
  end
end
