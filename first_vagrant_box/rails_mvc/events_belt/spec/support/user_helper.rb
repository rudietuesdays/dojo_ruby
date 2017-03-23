require "rails_helper"
  module CapybaraHelpers
    def log_in email: "jane@coder.com", password: "password"
      visit '/' unless current_path == "/"
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Log In'
    end

    def register first_name: "jane", last_name: "doe", email: "jane@coder.com", city: "New York", state: "NY", password: "password", password_confirmation: "password"
      visit '/' unless current_path == '/'
      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[email]', with: email
      fill_in 'user[city]', with: city
      # select(state, from: 'user[state]')
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password_confirmation
      click_button 'Register'
    end
  end
