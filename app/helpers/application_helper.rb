module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def site_title
    full_name = "#{t("website_name")} | #{t("website_description")}"

    if @campaign.present?
      "#{@campaign.title} - #{full_name}"
    else
      full_name
    end
  end

  def money_formatter(amount)
    number_to_currency(amount, unit: "").gsub(".00", "")
  end
end
