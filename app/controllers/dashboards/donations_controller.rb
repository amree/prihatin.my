class Dashboards::DonationsController < ApplicationController
  def index
    @donations = current_user.donations
  end
end
