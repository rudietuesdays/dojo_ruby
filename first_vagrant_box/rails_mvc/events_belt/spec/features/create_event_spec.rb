require 'rails_helper'
feature 'event feature' do
  before(:each) do
    @user = create(:user)
    log_in
    expect(current_path).to eq("/events")
    expect(page).to have_content "Welcome, #{@user.first_name}!"
  end

  feature "users personal event dashboard" do
    scenario "create a new event" do
      add_event
      @event = Event.last
      expect(current_path).to eq("/events/#{@event.id}")
      expect(page).to have_content "#{@event.name}"
    end
    scenario "delete an event" do
      @event = create(:event, user: @user)
      visit '/events'
      puts @event
      expect(page).to have_content "Delete"
      click_on "Delete"
      expect(page).not_to have_content "#{@event.name}"
    end
  end

end
