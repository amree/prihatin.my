class PreviewPresenter < SimpleDelegator
  def net_amount
    donation.pretty_net_amount
  end

  def fee_amount
    donation.pretty_gateway_fee
  end

  def total_amount
    donation.pretty_total_amount
  end

  private

  def donation
    __getobj__
  end
end
