require 'rails_helper'

# feature and scenario are Capybara's version of describe and it respectively
feature "guest user creates an account" do
  before(:each) do
    # visit navigates to a particular path. You can pass a string or use one of the Rails path helpers (both will work:  visit '/blog' and visit blogs_path)
    visit new_user_path
  end
  scenario "successfully creates a new user account" do
    # fill_in will fill in fields for you
    fill_in "user_first_name", with: "jane"
    fill_in "user_last_name", with: "doe"
    fill_in "user_email", with: "jane@codingdojo.com"
    # click_button will press a button or input[type="submit"]
    click_button "Create User"
    # have_content asserts that certain text content is present on the page
    # expect(page).to have_content "User successfully created"
    expect(page).to have_content "Welcome, jane"
    # We'll be redirecting to the user show page if user succesfully created
    expect(page).to have_current_path(user_path(User2.last))
  end
  scenario "unsuccessfully creates a new user account" do
    click_button "Create User"
    expect(current_path).to eq(new_user_path)
  end
  scenario "does not fill out first name field" do
    fill_in "user_last_name", with: "doe"
    fill_in "user_email", with: "jane@coder.com"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end
  scenario "does not fill out last name field" do
    fill_in "user_first_name", with: "jane"
    fill_in "user_email", with: "jane@coder.com"
    click_button "Create User"
    expect(page).to have_content "Last name can't be blank"
  end
  scenario "does not fill out email field" do
    fill_in "user_first_name", with: "jane"
    fill_in "user_last_name", with: "doe"
    click_button "Create User"
    expect(page).to have_content "Email can't be blank"
  end
end
