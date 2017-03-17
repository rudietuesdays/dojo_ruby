require 'rails_helper'

RSpec.describe User2, type: :model do
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
      # The build method will instantiate a new instance of your model class but won't save it to the database. Not saving is usually preferred over saving because making calls to the database will make our tests run slower.
      expect(build(:user, :masc).first_name).to eq("John")
      expect(build(:user, :femme).first_name).to eq("Jane")

      # can use multiple traits on the same instance
      # masc_admin = build(:user, :masc, :admin)
    end
  end
  context "With invalid attributes" do
    it "should not save if first_name field is blank" do
      expect(build(:user, first_name: "")).to be_invalid
    end
    it "should not save if last_name field is blank" do
      expect(build(:user, last_name: "")).to be_invalid
    end
    it "should not save if email already exists" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it "should not save if invalid email format" do
      expect(build(:user, email: "invalidEmail")).to be_invalid
    end
  end
end

# You can override any of the defined attributes by passing a hash into either function call.
# build(:user, first_name: 'oscar')
# create(:user, last_name: 'vazquez', email: 'ovazquez@codingdojo.com')
