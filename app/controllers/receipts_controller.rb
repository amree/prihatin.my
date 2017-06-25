class ReceiptsController < ApplicationController
  def index
    id = params.dig("billplz", "id")

    # @payment = UpdatePaymentStatusJob.new.perform(id)
    @payment = Payment.last

    if @payment.present?
      @payment = PaymentPresenter.new(@payment)
      @preview = PreviewPresenter.new(
        DonationPresenter.new(@payment.donation)
      )
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
