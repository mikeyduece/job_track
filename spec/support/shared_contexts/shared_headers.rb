RSpec.shared_context 'shared headers' do
  let(:headers) { { 'Accept': 'application/vnd.api+json'  } }
  let(:user) { create(:user) }
end