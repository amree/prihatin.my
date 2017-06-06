class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :slug
      t.string :state
      t.string :title
      t.string :description
      t.string :story
      t.date :end_on
      t.datetime :launched_at
      t.decimal :goal

      t.timestamps
    end
  end
end
