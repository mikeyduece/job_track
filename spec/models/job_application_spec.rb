require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  subject { create(:job_application) }

  context :validations do
    it { is_expected.to validate_presence_of(:company) }
    it { is_expected.to validate_presence_of(:user) }
  end

  context :associations do
    it { is_expected.to have_one(:primary_contact).class_name('Contact') }
    it { is_expected.to have_many(:contacts) }
    it { is_expected.to have_many(:job_application_tags).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:job_application_tags) }

  end

end
