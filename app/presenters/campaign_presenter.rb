class CampaignPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::DateHelper

  def days_left
    (campaign.end_on - Time.zone.now.to_date).to_i
  end

  def total_donors
    Donation.
      joins(:payment).
      where(
        donations: { campaign_id: campaign.id },
        payments: { state: Payment::PAID }
      ).count
  end

  def amount_collected
    amount =
      Donation.
        joins(:payment).
        where(
          donations: { campaign_id: campaign.id },
          payments: { state: Payment::PAID }
        ).sum(:donation_amount)

    money_formatter(amount)
  end

  def goal_amount
    money_formatter(campaign.goal)
  end

  private

  def campaign
    __getobj__
  end
end
