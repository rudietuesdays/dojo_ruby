require 'rails_helper'

RSpec.describe Message, type: :model do
  context "With valid attributes" do
    it "should save" do
      expect(build(:message)).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if message is blank" do
      message = Message.new()
      expect(message).to be_invalid
    end
    it "should not save if message is less than 10 characters" do
      message = Message.new(content: "message", user: User.first)
      expect(message).to be_invalid
    end
    it "must have a user as a foreign key" do
      message = Message.new(content: "This is a valid message")
      expect(message).to be_invalid
    end
  end
end
