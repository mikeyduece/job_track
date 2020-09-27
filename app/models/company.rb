# == Schema Information
#
# Table name: companies
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_name  (name)
#
class Company < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true
  
end
