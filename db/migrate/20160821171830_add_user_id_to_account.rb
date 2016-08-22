class AddUserIdToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :user_id, :integer
    add_index :accounts, [:user_id], name: :index_accounts_on_user_id
  end
end
