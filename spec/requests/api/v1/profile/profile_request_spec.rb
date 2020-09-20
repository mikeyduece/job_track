require 'rails_helper'

describe Api::V1::Profile::ProfileController, type: :request do
  let(:headers) { { 'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json' } }

  context 'GET #show' do
    before do
      get '/api/v1/profile', headers: headers
    end

    it 'should return ' do
      login_as_user

      expect(response).to be_successful
    end
  end

end
