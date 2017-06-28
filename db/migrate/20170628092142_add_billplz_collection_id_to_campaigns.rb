class AddBillplzCollectionIdToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :billplz_collection_id, :string, after: :user_id
  end
end
