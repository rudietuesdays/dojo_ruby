require "rails_helper"
module CapybaraHelpers
  def login_user(username: 'listhebeast')
    visit users_new_path unless current_path == users_new_path
    fill_in "username", with: username
    click_button "Sign In"
  end
end
