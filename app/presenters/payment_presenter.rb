class PaymentPresenter < SimpleDelegator
  def success?
    payment == Payment::PAID
  end

  def failed?
    payment == Payment::DUE
  end

  private

  def payment
    __getobj__
  end
end
