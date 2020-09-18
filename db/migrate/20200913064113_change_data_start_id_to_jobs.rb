class ChangeDataStartIdToJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :start_id, :integer
    change_column :jobs, :stop_id, :integer
    change_column :jobs, :end_id, :integer
  end
end
