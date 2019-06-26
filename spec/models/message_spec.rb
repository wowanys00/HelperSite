require 'rails_helper'

RSpec.describe Message, type: :model do
context "validation" do

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:user_id) }

    it { should validate_presence_of(:conversation_id) }


    it "should not be valid without body" do
       subject.body = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without user_id" do
       subject.user_id = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without conversation_id" do
      subject.conversation_id = nil
      expect(subject).to_not be_valid
    end
  end

  context "associations" do
	it { should belong_to(:user) }
    it { should belong_to(:conversation)}
  end
end
