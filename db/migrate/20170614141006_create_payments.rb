class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :donation, foreign_key: true
      t.string :gateway_ref
      t.string :state
      t.decimal :amount, precision: 6, scale: 2

      t.timestamps
    end
  end
end
