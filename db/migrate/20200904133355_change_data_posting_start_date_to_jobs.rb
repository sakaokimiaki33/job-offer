class ChangeDataPostingStartDateToJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :Posting_start_date, :date
    change_column :jobs, :Posting_end_date, :date
  end
end
