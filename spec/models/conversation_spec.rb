require 'rails_helper'

RSpec.describe Conversation, type: :model do
context "validation" do

    it { should validate_uniqueness_of(:sender_id) }


    it "should not be valid without text" do
       subject.sender_id = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without user_id" do
       subject.recipient_id = nil
       expect(subject).to_not be_valid
    end
  end

  context "associations" do
	it { should belong_to(:sender) }
    it { should belong_to(:recipient)}
    it { should have_many(:messages).dependent(:destroy)}

  end
end