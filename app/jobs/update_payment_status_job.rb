class UpdatePaymentStatusJob < ApplicationJob
  queue_as :default

  def perform(gateway_reference)
    return if gateway_reference.blank?

    payment = Payment.find_by(gateway_reference: gateway_reference)

    if payment.state == Payment::DUE
      bill = Billplz::Bill.find(id: gateway_reference)

      payment.update(state: bill.state)
    end

    payment
  end
end
