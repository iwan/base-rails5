class AddLocaleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locale, :string,  limit: 2, default: 'en'
  end
end
