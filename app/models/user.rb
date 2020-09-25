# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  auth0_id   :string
#
# Indexes
#
#  index_users_on_email  (email)
#
class User < ApplicationRecord
  has_many_attached :resumes

  has_many :applications, class_name: 'JobApplication', inverse_of: :user
  has_many :tags, through: :applications
  has_many :contacts, through: :applications

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

end
