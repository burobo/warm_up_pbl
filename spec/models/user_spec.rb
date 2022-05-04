require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    subject { user } 
    let(:user) { build(:user, name: name, email: email) }

    context "when name is blank" do
      let(:user) { build(:user, name: '') }

      it do
        expect(subject).to be_valid
      end
    end

    context "when email is blank" do
      let(:user) { build(:user, email: '') }

      it do
        expect(subject).not_to be_valid
      end
    end

    context "when email is not unique" do
      before { create(:user, email: 'test@example.com') }

      let(:user) { build(:user, email: 'test@example.com') }
      
      it do
        expect(subject).not_to be_valid
      end
    end
  end
end
