class JobApplicationSerializer < BaseSerializer
  set_type :application
  attributes :position, :company
  
  has_one :primary_contact, serializer: ContactSerializer
  has_many :contacts
  
end
