class CampaignsController < ApplicationController
  def show
    @campaign = find_campaign
  end

  def receipt
  end

  private

  def find_campaign
    Campaign.find params[:id]
  end
end
