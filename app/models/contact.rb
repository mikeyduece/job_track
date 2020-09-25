# == Schema Information
#
# Table name: contacts
#
#  id                 :uuid             not null, primary key
#  email              :string           not null
#  first_name         :string           not null
#  last_name          :string           not null
#  primary            :boolean          default(FALSE)
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_application_id :uuid             not null
#
# Indexes
#
#  index_contacts_on_email               (email)
#  index_contacts_on_job_application_id  (job_application_id)
#
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
