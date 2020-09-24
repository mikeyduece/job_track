class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email
  
  has_many :applications, serializer: JobApplicationSerializer
  
end

