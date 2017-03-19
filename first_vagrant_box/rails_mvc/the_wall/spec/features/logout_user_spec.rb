require 'rails_helper'
feature 'logout user' do
  before(:each) do
    @user = create(:user)
    visit users_new_path
    fill_in "username", with: "rudie_rae"
    click_button "Sign In"
  end

  scenario 'successfully logs out' do
    expect(page).to have_content "Log Out"
    click_link('Log Out')
    expect(page).to have_content "Sign In"
  end
end
