class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_img, UserImageUploader
  validates :company_name, presence: true
  validates :company_name_kana, presence: true
  validates :business_content, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.search(search)
    if search
      Job.where(['company_name LIKE ?', "%#{search}%"])
    else
      Job.all
    end
  end

  has_one :address, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :address
    # 親モデルで "accepts_nested_attributes_for :子モデル名" を定義することでフォームから送信した値を親と子のテーブルに同時に保存する。
  # has_many :cards, dependent: :destroy
  has_many :jobs, dependent: :destroy
  # has_many :comments, dependent: :destroy
end
