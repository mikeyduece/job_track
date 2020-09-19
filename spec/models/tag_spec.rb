require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { create(:tag) }

  context :validations do
    it { is_expected.to validate_presence_of(:name) }
  end

  context :associations do
    it { is_expected.to have_many(:job_application_tags).dependent(:destroy) }
  end
end
