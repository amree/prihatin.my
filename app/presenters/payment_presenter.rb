class PaymentPresenter < SimpleDelegator
  def success?
    payment.state == Payment::PAID
  end

  def failed?
    payment.state == Payment::DUE
  end

  def donation
    DonationPresenter.new(payment.donation)
  end

  def campaign
    CampaignPresenter.new(payment.donation.campaign)
  end

  private

  def payment
    __getobj__
  end
end
