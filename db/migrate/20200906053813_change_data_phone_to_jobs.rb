class ChangeDataPhoneToJobs < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :phone, :text
  end
end
