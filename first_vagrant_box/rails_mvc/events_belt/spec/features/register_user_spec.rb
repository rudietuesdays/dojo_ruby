require 'rails_helper'
feature 'User features' do

  feature "user sign-up" do
    scenario 'visits sign-up page' do
      visit root_path
      expect(page).to have_content "Register"
    end
    scenario "with proper inputs, create user and redirects to events homepage" do
      register
      expect(current_path).to eq("/events")
      expect(page).to have_content "User successfully created!"
    end
  end

  feature "with invalid inputs, redirects back to sign in and shows validations" do
    scenario "because first name is blank" do
      register first_name: ''
      expect(current_path).to eq('/')
      expect(page).to have_content "First name can't be blank"
    end
    scenario "because last name is blank" do
      register last_name: ''
      expect(current_path).to eq('/')
      expect(page).to have_content "Last name can't be blank"
    end
    scenario "because city is blank" do
      register city: ''
      expect(current_path).to eq('/')
      expect(page).to have_content "City can't be blank"
    end
    scenario "because email is blank" do
      register email: ''
      expect(current_path).to eq('/')
      expect(page).to have_content "Email can't be blank"
    end
    scenario "because email not in correct format" do
      register email: 'abc123.com'
      expect(current_path).to eq('/')
      expect(page).to have_content "Email is invalid"
    end
    scenario "because password field is blank" do
      register password: ''
      expect(current_path).to eq('/')
      expect(page).to have_content "Password can't be blank"
    end
    scenario "because passwords do not match" do
      register password: 'notpassword'
      expect(current_path).to eq('/')
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  feature "user homepage" do
    scenario "displays user information" do
      @user = create(:user)
      log_in
      expect(current_path).to eq("/events")
      expect(page).to have_content "Welcome,"
      expect(page).to have_text(@user.first_name)
    end
  end

  # feature 'User features' do
  #
  #   feature "User Settings Dashboard" do
  #     before(:each) do
  #       @user = create(:user)
  #       log_in
  #       visit "/users/#{@user.id}/edit"
  #     end
  #     scenario "visit users edit page" do
  #       expect(current_path).to eq("/users/#{@user.id}/edit")
  #       expect(page).to have_content "Edit your profile"
  #     end
  #     scenario "inputs filled out correctly" do
  #       expect(page).to have_selector("input[value='#{@user.name}']")
  #       expect(page).to have_selector("input[value='#{@user.email}']")
  #     end
  #     scenario "incorrectly updates information" do
  #       fill_in "user[email]", with: "1234.com"
  #       click_button "Update User"
  #       expect(page).to have_current_path("/users/#{@user.id}/edit")
  #       expect(page).to have_content "Email is invalid"
  #     end
  #     scenario "correctly updates information" do
  #       fill_in "user[name]", with: "new name"
  #       fill_in "user[email]", with: "new@email.com"
  #       click_button "Update User"
  #       expect(current_path).to eq('/users/show')
  #       expect(page).to have_content "Shhh"
  #       # expect(page).to have_text(@user.name)
  #     end
  #     scenario "destroys user and redirects to registration page" do
  #       click_button "Delete User"
  #       expect(current_path).to eq('/users/new')
  #     end
  #   end
  # end

end
