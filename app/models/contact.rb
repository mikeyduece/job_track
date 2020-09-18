class Contact < ApplicationRecord
  belongs_to :job_application, inverse_of: :contacts

  def primary?
    primary
  end

end
