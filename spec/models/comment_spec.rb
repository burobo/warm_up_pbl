require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    subject { comment }
    let(:comment) { build(:comment, content: content) }

    context "when content is blank" do
      let(:comment) { build(:comment, content: '') }

      it do
        expect(subject).not_to be_valid
      end
    end
  end
end
