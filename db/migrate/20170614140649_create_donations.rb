class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.references :campaign, foreign_key: true
      t.decimal :donation_amount, precision: 6, scale: 2, default: 0
      t.decimal :website_amount, precision: 6, scale: 2, default: 0

      t.timestamps
    end
  end
end
