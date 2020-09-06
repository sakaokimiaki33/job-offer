class ChangeDataPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :phone, :text
  end
end
