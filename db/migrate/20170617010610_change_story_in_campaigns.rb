class ChangeStoryInCampaigns < ActiveRecord::Migration[5.1]
  def up
    change_column :campaigns, :story, :text
  end

  def down
    change_column :campaigns, :story, :string
  end
end
