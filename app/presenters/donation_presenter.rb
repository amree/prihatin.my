class DonationPresenter < SimpleDelegator
  include ApplicationHelper
  extend PresenterCollection

  def campaign
    CampaignPresenter.new(donation.campaign)
  end

  def donated_on
    created_at.strftime("%d-%m-%Y")
  end

  def pretty_total_amount
    money_formatter(donation.payment.amount, true)
  end

  private

  def donation
    __getobj__
  end
end
