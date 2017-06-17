class AddUserToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :user, foreign_key: true, after: :id
  end
end
