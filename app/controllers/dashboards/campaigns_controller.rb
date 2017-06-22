class Dashboards::CampaignsController < ApplicationController
  def index
    @campaigns = CampaignPresenter.wrap(current_user.campaigns)
  end
end
