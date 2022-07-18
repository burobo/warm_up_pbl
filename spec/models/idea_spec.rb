require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'validation' do
    subject { idea } 
    let(:user) { build(:user) }
    let(:idea) { build(:idea, title: title, outline: outline, detail: detail, user: user, emoji: emoji) }

    context "normal" do
      let(:idea) {build(:idea)}
      it do
        expect(subject).to be_valid
      end
    end

    context "when title is blank" do
      let(:idea) { build(:idea, title: '') }

      it do
        expect(subject).not_to be_valid
      end
    end
    context "when outline is blank" do
      let(:idea) { build(:idea, outline: '') }

      it do
        expect(subject).not_to be_valid
      end
    end
    context "when detail is blank" do
      let(:idea) { build(:idea, detail: '') }

      it do
        expect(subject).not_to be_valid
      end
    end
    context "when user is blank" do
      let(:idea) { build(:idea, user: nil) }

      it do
        expect(subject).not_to be_valid
      end
    end
  end
end
