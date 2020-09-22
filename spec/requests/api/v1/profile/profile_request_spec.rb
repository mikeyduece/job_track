require 'rails_helper'

describe Api::V1::Profile::ProfileController, type: :request do
  let(:headers) { { 'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json', 'Authorization': 'Bearer token' } }

  context 'GET #show' do
    before do
      login_as_user
      get '/api/v1/profile', headers: headers
    end

    it 'should return ' do
      expect(response).to be_successful
    end
  end

end
