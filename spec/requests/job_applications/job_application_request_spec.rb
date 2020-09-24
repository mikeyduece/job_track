require 'rails_helper'

describe Api::V1::JobApplications::JobApplicationsController, type: :request do
  let(:headers) { { 'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json' } }
  let(:user) { create(:user) }
  let(:params) { {} }
  
  before { login_as_user(user) }
  
  context 'POST #create' do
    # TODO: Refactor once auth0 is set up
    before { post "/api/v1/job_applications", params: params.to_json, headers: headers }

    it { is_expected.to have_http_status(:created) }
  end
end