class AddBillplzApiKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :billplz_api_key, :string, after: :id
  end
end
