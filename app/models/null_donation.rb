class NullDonation
  attr_reader(
    :net_amount,
    :gateway_fee,
    :payment
  )

  def net_amount
  end

  def gateway_fee
  end

  def payment_amount
  end

  def payment
    @payment ||= NullPayment.new
  end
end
