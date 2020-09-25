# == Schema Information
#
# Table name: job_application_tags
#
#  id                 :uuid             not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_application_id :uuid             not null
#  tag_id             :uuid             not null
#
# Indexes
#
#  index_job_application_tags_on_job_application_id  (job_application_id)
#  index_job_application_tags_on_tag_id              (tag_id)
#
class JobApplicationTag < ApplicationRecord

  belongs_to :tag, inverse_of: :job_application_tags
  belongs_to :job_application, inverse_of: :job_application_tags

end
