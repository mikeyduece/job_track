class JobApplicationTag < ApplicationRecord

  belongs_to :tag, inverse_of: :job_application_tags
  belongs_to :job_application, inverse_of: :job_application_tags

end
