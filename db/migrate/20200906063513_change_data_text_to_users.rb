class ChangeDataTextToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :text,:phone
  end
end
