class Contact < ApplicationRecord
  # Associations
  # Belongs To
  belongs_to :job_application, inverse_of: :contacts

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def primary?
    primary
  end

  def primary!
    return true if primary
    where(primary: true).update_all(primary: false)
    
    update!(primary: true)
  end

end
