class ChangeDataTextToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :text,:postal_code
  end
end
