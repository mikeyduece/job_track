class Tag < ApplicationRecord

  has_many :job_application_tags, inverse_of: :tag

end
