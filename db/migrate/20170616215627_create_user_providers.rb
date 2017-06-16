class CreateUserProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :user_providers do |t|
      t.references :user, foreign_key: true
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
