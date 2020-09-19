require 'rails_helper'

RSpec.describe JobApplicationTag, type: :model do
  subject { create(:job_application_tag) }

  context :associations do
    it { is_expected.to belong_to(:job_application) }
    it { is_expected.to belong_to(:tag) }
  end
end
