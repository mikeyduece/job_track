require 'rails_helper'

RSpec.describe Api::V1::Users::UsersController, type: :request do
  include_context 'shared headers'
  let(:params) {
    { data: {
      type: 'user',
      attributes: {
        resume_url: "https://job-track.s3.amazonaws.com/users/#{user.id}/my-resume.pdf"
      }
    } }
  }
  before(:each) do
    login_as_user(user)
    patch '/api/v1/users', params: params.to_json, headers: headers
  end
  
  describe 'PATCH #update' do
    it { expect(response).to have_http_status(:ok) }
    it { expect(user.resumes).not_to be_empty }
    it { expect(user.resumes.last.resume_url).not_to be_nil }
  end
end