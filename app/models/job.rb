class Job < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # belongs_to :category
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :employment
  belongs_to :strat_id, class_name: "User", optional: true
  belongs_to :stop_id, class_name: "User", optional: true
  belongs_to :end_id, class_name: "User", optional: true

  def self.search(search)
    if search
      Job.where(['job_description LIKE ?', "%#{search}%"])
    else
      Job.all
    end
  end

  validates :images, presence: { message: 'は１枚以上登録してください' }
  validates :Posting_start_date, :Posting_end_date, :employment_id, :job_description, :qualification, :salary, :treatment, :working_hours, :holiday, :work_location, :application_method, :contact, :location, :phone, :start_id, presence: true
  validates :employment_id, numericality: { greater_than: 0, message: "を選択してください" }
  # validates :category_id, presence: true

end
