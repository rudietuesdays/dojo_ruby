require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid attributes" do
    it 'should not save if username is blank' do
      user = User.new()
      expect(user).to be_invalid
    end
    it 'should not save if username is already in the db' do
      user1 = User.create(username: 'rae_rudie')
      user2 = User.new(username: 'rae_rudie')
      expect(user2).to be_invalid
    end
    it 'must be longer than 5 characters' do
      user = User.create(username: 'rae')
      expect(user).to be_invalid
    end
  end
end
