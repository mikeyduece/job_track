class Api::V1::JobApplications::JobApplicationsController < ApplicationController
  
  def create
    service = JobApp::CreateService.call(current_user, create_job_application_params)
    return error_response(service.errors) unless service.success?
    
    success_response({ message: 'Application successfully created' }, :created)
  end
  
  private
  
    def create_job_application_params
      # TODO: Refactor to explicitly permit certain params
      params.permit!
    end

end