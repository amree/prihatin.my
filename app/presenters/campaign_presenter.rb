class CampaignPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers
  extend PresenterCollection

  def days_left
    (campaign.end_on - Time.zone.now.to_date).to_i
  end

  def total_donations
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

  def organizer_facebook_url
    uid = campaign.organizer.user_providers.find_by(provider: "facebook").uid

    "https://facebook.com/#{uid}"
  end

  def pretty_end_on
    end_on.strftime("%d-%m-%Y")
  end

  def facebook_og
    @facebook_og ||= FacebookOpenGraphPresenter.new(campaign)
  end

  def url
    "#{ENV['PUBLIC_URL']}#{campaign_slug_path(campaign.slug)}"
  end

  def share_url(source:, medium:)
    [
      url,
      "?utm_source=#{source}",
      "&utm_medium=#{medium}",
      "&utm_campaign=#{campaign.slug}",
    ].join("")
  end

  private

  def campaign
    __getobj__
  end
end
