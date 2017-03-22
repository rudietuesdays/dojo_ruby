require 'rails_helper'
feature "secret features" do
  before do
    @user1 = create(:user)
    @user2 = create(:user, name: 'jane', email: 'jane@coder.com')
    @secret2 = create(:secret, user: @user2)
    log_in
    expect(current_path).to eq("/users/#{@user1.id}")
    expect(page).to have_content "Welcome, #{@user1.name}"
  end

  feature "Users personal secret page" do
    scenario "shouldn't see other user's secrets" do
      expect(page.has_content?("#{@secret2.content}")).to be(false)
    end
    scenario "create a new secret" do
      expect(page).to have_content "New Secret"
      fill_in "content", with: "i've got a lot to confess"
      click_button "Confess"
      expect(current_path).to eq("/users/#{@user1.id}")
      expect(page).to have_content "i've got a lot to confess"
    end
    scenario "destroy secret from profile page, redirects to user profile page" do
      @secret1 = create(:secret, user: @user1)
      visit "/users/#{@user1.id}"
      click_on "Delete"
      expect(page).not_to have_content(@secret1.content)
    end
  end

  feature "Secret Dashboard" do
    before do
      @secret1 = create(:secret, user: @user1)
      visit '/secrets'
    end
    scenario "displays everyone's secrets" do
      expect(page).to have_content "#{@secret1.content}"
      expect(page).to have_content "#{@secret2.content}"
    end
    scenario "destroy secret from index page, redirects to user profile page" do
      click_on "Delete"
      expect(current_path).to eq("/users/#{@user1.id}")
      expect(page).not_to have_content(@secret1.content)
    end
  end
end
