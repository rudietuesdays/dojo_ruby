require 'rails_helper'
feature "guest user creates an account" do
  before(:each) do
    visit users_new_path
  end
  context "successfully" do
    scenario "logs in a user account" do
      fill_in "username", with: "listhebeast"
      click_button "Sign In"
      expect(page).to have_content "Coding Dojo Wall"
      expect(page).to have_content "Welcome, listhebeast"
      expect(page).to have_current_path(messages_path)
    end
    scenario "creates a new user account" do
      fill_in "username", with: "raeraerae"
      click_button "Sign In"
      expect(page).to have_content "Coding Dojo Wall"
      expect(page).to have_content "Welcome, raeraerae"
      expect(page).to have_current_path(messages_path)
    end
  end

  context "unsuccessfully because" do
    scenario "name is too short" do
      fill_in "username", with: "rae"
      click_button "Sign In"
      expect(page).to have_content "Username is too short"
      expect(page).to have_current_path(users_new_path)
    end
  end
end
