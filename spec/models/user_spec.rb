require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  context :validations do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context :associations do
    it { is_expected.to have_many(:applications) }
    it { is_expected.to have_many(:tags).through(:applications) }
    it { is_expected.to have_many(:contacts).through(:applications) }
  end

end
