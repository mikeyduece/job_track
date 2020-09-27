# == Schema Information
#
# Table name: job_applications
#
#  id         :uuid             not null, primary key
#  job_type   :integer          default("frontend"), not null
#  position   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_job_applications_on_job_type  (job_type)
#  index_job_applications_on_position  (position)
#  index_job_applications_on_user_id   (user_id)
#
class JobApplication < ApplicationRecord
  has_one :primary_contact, -> { where(primary: true) }, class_name: 'Contact'
  has_one :company

  belongs_to :user, inverse_of: :applications

  has_many :contacts, dependent: :destroy
  has_many :job_application_tags, dependent: :destroy, inverse_of: :job_application
  has_many :tags, through: :job_application_tags

  validates :company, :position, :user, presence: true

  enum job_type: %i[frontend backend full_stack]
  
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

end
