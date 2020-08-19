class AddPostingStartDateToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :Posting_start_date, :integer, null: false
  end
end
