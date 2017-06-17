class AddGatewayFeeToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :gateway_fee, :decimal, precision: 6, scale: 2, after: :website_amount
  end
end
