require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject { create(:contact) }

  context :validations do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context :associations do
    it { is_expected.to belong_to(:job_application) }
  end

  context :instance_methods do
    describe '#primary?' do
      it 'defaults to false upon creation' do
        expect(subject.primary?).to be_falsey
      end

      it 'can change to primary' do
        subject.update(primary: true)
        expect(subject.reload.primary?).to be_truthy
      end
    end
  end

end
