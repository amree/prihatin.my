module DonationsHelper
  OPTIONS = [5, 10, 20, 50].freeze

  def donation_options
    OPTIONS.map do |option|
      [option, "#{t("currency")} #{option}"]
    end
  end
end
