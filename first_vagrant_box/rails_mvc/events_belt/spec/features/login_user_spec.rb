require 'rails_helper'
feature 'authentication feature' do

  before(:each) do
    @user = create(:user)
  end

  feature "user attempts to sign-in" do

    scenario 'visits sign-in page, prompted with email and password fields' do
      visit '/'
      expect(page).to have_content("Login")
    end

    scenario 'logs in user if email/password combination is valid' do
      log_in
      expect(current_path).to eq("/events")
      expect(page).to have_content "Welcome, #{@user.first_name}!"
    end

    scenario 'does not sign in user if email is not found' do
      log_in email: 'notanemail'
      expect(page).to have_content "Invalid email or password"
      expect(page).to have_current_path(root_path)
    end

    scenario 'does not sign in user if email/password combination is invalid' do
      log_in password: 'notpassword'
      expect(page).to have_content "Invalid email or password"
      expect(page).to have_current_path(root_path)
    end
  end

  feature "user attempts to log out" do
    before(:each) do
      log_in
    end

    scenario 'displays "Log Out" button when user is logged on' do
      expect(page).to have_content "Log Out"
    end

    scenario 'logs out user and redirects to login page' do
      click_on "Log Out"
      expect(page).to have_current_path (root_path)
      expect(page).to have_button "Log In"
    end

  end
end
