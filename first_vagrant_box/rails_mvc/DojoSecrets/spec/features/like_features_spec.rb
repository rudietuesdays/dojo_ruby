require 'rails_helper'
feature 'Like Features' do
  before do
    @user = create(:user)
    log_in
    @secret = create(:secret, user: @user)
    visit '/secrets'
  end

  feature 'secret has not been liked' do
    scenario "like count updated correctly" do
      expect(page).to have_text(@secret.content)
      expect(page).to have_content "0 likes"
    end
    scenario "displays like button if you haven't liked secret" do
      expect(page).to have_content "Like"
    end
    scenario "liking will update like count, like button not visible" do
      click_on "Like"
      expect(page).to have_content "Unlike"
      expect(page).to have_content "1 likes"
    end
  end

  feature "secret has been liked" do
    before do
      click_on "Like"
    end
    scenario "unlike button is visible" do
      expect(page).to have_content "Unlike"
    end
    scenario "unliking will update like count" do
      click_on "Unlike"
      expect(page).to have_content "0 likes"
    end
  end
end
