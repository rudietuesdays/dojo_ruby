require "rails_helper"
  module CapybaraHelpers
    def add_event name: 'punk rawk show', date: "2017-08-20", city: 'Portland', state: "OR"
      visit '/events' unless current_path == '/'
      fill_in 'event[name]', with: name
      # select date, :from => 'event[date]'
      fill_in 'event[date]', with: "2017-08-23"
      fill_in 'event[city]', with: city
      click_button 'Add Event'
    end
  end
