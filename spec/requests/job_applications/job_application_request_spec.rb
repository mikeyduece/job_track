require 'rails_helper'

describe Api::V1::Users::JobApplicationsController, type: :request do
  let(:headers) { { 'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json' } }
  let(:params) { {} }
  context 'POST #create' do
    # TODO: Refactor once auth0 is set up
    before(:each) do 
      post "/api/v1/users/#{user.id}/applications", params: params.to_json, headers: headers
    end

  end
end