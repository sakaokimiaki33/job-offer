class ChangeDataPhoneToJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :phone, :bigint
  end
end
