require 'rails_helper'

describe Api::V1::Profile::ProfileController, type: :request do
  let(:headers) { {'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json', 'Authorization': 'Bearer token'} }
  let(:user) { create(:user_with_apps) }
  let(:attributes) { user.attributes.to_h.symbolize_keys!.except(:id, :auth0_id, :created_at, :updated_at) }

  context 'GET #show' do
    before do
      login_as_user(user)
      get '/api/v1/profile', headers: headers
    end

    it { expect(response).to be_successful }

    it 'should have correct serialization return' do
      res = json_response
      require 'pry'; binding.pry
      expect(res.dig(:data, :id)).to eq(user.id)
      expect(res.dig(:data, :type)).to eq('user')
      expect(res.dig(:data, :attributes)).to include(attributes)
      expect(res.dig(:included)).to be_a_kind_of(Array)
      expect(res.dig(:data, :relationships)).to be_a_kind_of(Hash)
    end
  end

end
