class JobApplications::CreateService < JobApplications::BaseJobApplicationsService
  
  def call
    job_app = create_job_application
    
    Success.new(job_application: job_app)
  rescue StandardError => e
    Rails.logger.error(e.message)
    Failure.new(errors: e.message)
  end
  
  private
  
  def create_job_application
    attrs = attributes(params.to_h).merge!(contacts_attributes)
    
    user.applications.create!(attrs)
  end

end
