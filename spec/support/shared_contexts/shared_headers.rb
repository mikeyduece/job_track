RSpec.shared_context 'shared headers' do
  let(:headers) { { 'Accept': 'application/vnd.job-track.json; version=1'  } }
  let(:user) { create(:user) }
end