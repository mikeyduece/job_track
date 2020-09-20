class User < ApplicationRecord
  has_one_attached :resume

  has_many :applications, class_name: 'JobApplication', inverse_of: :user
  has_many :tags, through: :applications
  has_many :contacts, through: :applications

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

end
