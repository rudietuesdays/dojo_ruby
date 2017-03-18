require 'rails_helper'
feature 'create a new message' do
  before(:each) do
    visit messages_path
  end

  context "successfully" do
    scenario "creates and posts a message" do
      fill_in "content", with: "This is a valid message wow"
      click_button "Post a Message"
      expect(page).to have_content "Coding Dojo Wall"
      expect(page).to have_content "This is a valid message wow"
      expect(page).to have_current_path(messages_path)
    end
  end

  context "unsuccessfully because" do
    scenario "message is too short" do
      fill_in "content", with: "invalid"
      click_button "Post a Message"
      expect(page).to have_content "Coding Dojo Wall"
      expect(page).to have_content "is too short (minimum is 11 characters)"
      expect(page).to have_current_path(messages_path)
    end
  end
end
