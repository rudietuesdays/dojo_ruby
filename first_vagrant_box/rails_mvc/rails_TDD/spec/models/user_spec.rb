# set up testing env by telling rails to import file '/spec/rails_helper.rb'
require 'rails_helper'

# tells rails thats you are going to be describing a set of tests that you want to run
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}" # this test is created with the file

  context "With valid attributes" do
    it "should save" do
      user = User.new(
        first_name: 'rae',
        last_name: 'gaines',
        email: 'rae@coder.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do
    it 'should not save if first_name is blank' do
      user = User.new(
        first_name: '',
        last_name: 'chang',
        email: "chang@coder.com"
      )
      expect(user).to be_invalid
    end

    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: 'rae',
        last_name: '',
        email: "rae@coder.com"
      )
      expect(user).to be_invalid
    end

    it "should not save if email already exists" do
      user1 = User.create(first_name: 'rae', last_name: 'gaines', email: 'rae@coder.com')
      user2 = User.new(first_name: 'lisa', last_name: 'sims', email: 'rae@coder.com')
      expect(user2).to be_invalid
    end

    it "should not save if invalid email format" do
      user = User.new(first_name: 'rae', last_name: 'gaines', email: 'raecoder1234')
      expect(user).to be_invalid
    end
  end

end
