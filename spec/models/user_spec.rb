require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    context 'when using standard factory' do
      it { expect(build(:user)).to be_valid }

      it { expect(create(:user).authentication_token.size).to eq(20) }
    end
  end

  describe 'validations' do
    context 'when user does not an email' do
      it { expect(build(:user, email: nil)).not_to be_valid }
    end

    context 'when user has no username' do
      it { expect(build(:user, username: nil)).not_to be_valid }
    end

    context 'when admin field is nil' do
      it { expect(build(:user, is_admin: nil)).not_to be_valid }
    end

    context 'whe admin field false' do
      it { expect(build(:user, is_admin: false)).to be_valid }
    end

    context 'when age is lower than 10' do
      it { expect(build(:user, age: 9)).not_to be_valid }
    end
  end
end
