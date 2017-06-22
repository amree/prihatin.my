class Dashboards::DonationsController < ApplicationController
  def index
    @donations = DonationPresenter.wrap(current_user.donations)
  end
end
