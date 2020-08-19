class RenameEmploymentStatusIdColumnToEmployment < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :employment_status_id, :employment_id
  end
end
