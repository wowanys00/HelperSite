require 'rails_helper'

RSpec.describe Comment, type: :model do
	 
context "validation" do

    it { should validate_presence_of(:text) }

    it { should validate_presence_of(:user_id) }

    it { should validate_presence_of(:work_id) }


    it "should not be valid without text" do
       subject.text = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without user_id" do
       subject.user_id = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without work_id" do
      subject.work_id = nil
      expect(subject).to_not be_valid
    end
  end

  context "associations" do
	it { should belong_to(:user) }
    it { should belong_to(:work)}
  end
end
  