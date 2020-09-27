require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class.new }
  
  context :associations do
    it { is_expected.to belong_to(:application) }
  end
  
  context :validations do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
