require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
     build(:user)
    }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
     it "should not be valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without firstname" do
      subject.firstname = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without lastname" do
      subject.lastname = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without views" do
      subject.work_id = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without bio" do
      subject.bio = nil
      expect(subject).to_not be_valid
    end  
     it "should not be valid without age" do
      subject.age = nil
      expect(subject).to_not be_valid
    end
     it "should not be valid without phone" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "associations" do
    it { should have_many(:works)}
    it { should have_many(:comments).dependent(:destroy)}
  end
end
