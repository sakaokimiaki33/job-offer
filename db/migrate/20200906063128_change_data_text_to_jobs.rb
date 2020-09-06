class ChangeDataTextToJobs < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :text,:phone
  end
end
