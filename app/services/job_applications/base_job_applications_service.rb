class JobApplications::BaseJobApplicationsService < BaseService
  
  def initialize(user, params)
    @user = user
    @params = params
  end
  
  private
  
  attr_reader :user, :params
  
  def contacts_attributes
    { contacts_attributes: [attributes(relationships.dig(:contacts))] }
  end
  
end