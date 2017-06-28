class AddCoverUrlToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :cover_url, :string, after: :goal
  end
end
