class Tag < ApplicationRecord

  has_many :job_application_tags, dependent: :destroy, inverse_of: :tag
  validates :name, presence: true
end
