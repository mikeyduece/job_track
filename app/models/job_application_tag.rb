class JobApplicationTag < ApplicationRecord

  belongs_to :tag, inverse_of: :tags
  belongs_to :job_application, inverse_of: :tags

end
