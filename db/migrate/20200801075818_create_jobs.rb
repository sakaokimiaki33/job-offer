class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :occupation, null: false
      t.integer :Posting_end_date, null: false
      t.string :employment_status, null: false
      t.text :job_description, null: false
      t.text :qualification, null: false
      t.text :salary, null: false
      t.text :treatment, null: false
      t.text :working_hours, null: false
      t.text :holiday, null: false
      t.string :work_location, null: false
      t.text :application_method, null: false
      t.string :contact, null: false
      t.string :location, null: false
      t.integer :phone, null: false
      t.string :contact_name, null: false
      t.string :hp_address
      t.text :start_id, null: false
      t.text :stop_id
      t.text :end_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
