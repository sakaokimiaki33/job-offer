class ChangeDataPostalCodeToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postal_code, :text
  end
end
