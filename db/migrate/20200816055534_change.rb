class Change < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :contact_name, :string, null: false
    add_column    :jobs, :contact_name, :string
  end
end
