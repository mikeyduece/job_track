# == Schema Information
#
# Table name: tags
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name)
#
class Tag < ApplicationRecord

  has_many :job_application_tags, dependent: :destroy, inverse_of: :tag
  validates :name, presence: true
end
