class ChangeDataPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :text
    change_column :users, :faxphone, :text
  end
end
