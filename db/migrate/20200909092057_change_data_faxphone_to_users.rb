class ChangeDataFaxphoneToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :faxphone, :bigint
  end
end
