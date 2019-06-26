require 'rails_helper'

RSpec.describe Work, type: :model do
  let!(:user){
    create(:user)
  }

  subject{
     build(:work)
  }

  context "validation" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:views) }

    #it { should validate_presence_of(:photos) }

  #  it "is valid with valid attributes" do
  #    expect(subject).to be_valid
  #  end

    it "should not be valid without title" do
       subject.title = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without body" do
       subject.body = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without views" do
      subject.views = nil
      expect(subject).to_not be_valid
    end
  end

  context "association" do
    it { should belong_to(:user) }
  end
end