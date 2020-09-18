class JobApplication < ApplicationRecord
  has_one :primary_contact, -> { where(primary: true) }, class_name: 'Contact'

  belongs_to :user, inverse_of: :applications

  has_many :contacts, dependent: :destroy
  has_many :job_application_tags, dependent: :destroy, inverse_of: :job_application
  has_many :tags, through: :job_application_tags
end
