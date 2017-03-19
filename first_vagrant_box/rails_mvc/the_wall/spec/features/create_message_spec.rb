require 'rails_helper'
feature 'create a new message' do
  before(:each) do
    @user = create(:user)
    visit users_new_path
    fill_in "username", with: "rudie_rae"
    click_button "Sign In"
  end

  context "successfully" do
    scenario "creates and posts a message" do
      expect(page).to have_content "Coding Dojo Wall"
      fill_in "message[content]", with: "This is a valid message wow"
      click_button "Post a Message"
      expect(page).to have_content "This is a valid message wow"
      expect(page).to have_current_path(messages_path)
    end
  end

  context "unsuccessfully because" do
    scenario "message is too short" do
      expect(page).to have_content "Coding Dojo Wall"
      fill_in "message[content]", with: "invalid"
      click_button "Post a Message"
      expect(page).to have_content "is too short (minimum is 11 characters)"
      expect(page).to have_current_path(messages_path)
    end
  end
end
