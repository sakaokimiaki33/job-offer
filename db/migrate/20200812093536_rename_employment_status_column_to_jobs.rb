class RenameEmploymentStatusColumnToJobs < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :employment_status, :employment_status_id
  end
end
