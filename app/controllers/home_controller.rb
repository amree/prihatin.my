class HomeController < ApplicationController
  def index
    @campaigns =
      CampaignPresenter.wrap(
        Campaign.where(state: Campaign::ACTIVE)
      )
  end
end
