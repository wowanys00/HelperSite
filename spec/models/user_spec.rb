require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
     build(:user)
    }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "associations" do
    it { should have_many(:works)}
    it { should have_many(:comments).dependent(:destroy)}
  end
end
