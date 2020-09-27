# == Schema Information
#
# Table name: company_job_applications
#
#  id                 :uuid             not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :uuid             not null
#  job_application_id :uuid             not null
#
# Indexes
#
#  index_company_job_applications_on_company_id          (company_id)
#  index_company_job_applications_on_job_application_id  (job_application_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (job_application_id => job_applications.id)
#
class CompanyJobApplication < ApplicationRecord
  belongs_to :company
  belongs_to :job_application
  
  
end
