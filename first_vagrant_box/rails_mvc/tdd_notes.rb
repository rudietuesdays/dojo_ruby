### Run RSpec in the terminal
# cd project
# rspec project_spec.rb
# rspec . # to run mutiple files at once

### RSpec Methods

RSpec.describe "Buy a soda" do
  before(:each) do
    @buyer = Buyer.new
  end

  context "has money" do
    it "buy the soda" do
      buyer = Buyer.new
        buyer.money = 10
        expect(buyer.buy_soda).to eq(true)
    end
  end
  context "doesn't have money"
    it "can't buy the soda" do
      buyer = Buyer.new
        buyer.money = 0
        expect(buyer.buy_soda).to eq(false)
    end
  end
end

### More RSpec methods in a cheat sheet...

require "rspec"
RSpec.describe do
    it "cheat sheet" do
        expect(true).to be_truthy
        expect(false).to be_falsey
        expect("string").to eq("string")
        expect("string").to_not eq("not")
        expect(<valid_instance>).to be_valid
        expect(<invalid_instance>).to be_invalid
    end
end

### RSpec Expectations ###

=begin
Modifiers:
  expect

Matchers usually consist of booleans:
  >
  <
  >=
  <=
  ==

Predicate Matchers are commonly paired with the "should" modifier:
  be_valid
  be_within
  be_a_kind_of
  be_an_instance_of
  be_true
  be_false
  be_nil
  ...

=end

#Examples:
player.ammo.should > 10
player.ammo.should_not <= 10
player.ammo.should_not be <= 10

ninja.happy?.should == true
ninja.happy?.should_not == false
ninja.happy?.should_not be_false
ninja.happy?.should eq true
ninja.should be_happy

### RAILS TDD ###

* Run all the spec tests: rspec spec

* Run all the spec tests in a specific file: rspec spec/<FOLDER>/<FILENAME>
i.e. rspec spec/models/user_spec.rb

* Run a specific spec test: rspec spec/<FOLDER>/<FILENAME>:<LINE_NUMBER>
  i.e. rspec spec/models/user_spec.rb:4
  This will run the spec test on line 4.

##### RSpec routes #####

# the following examples check the same route:
expect(get("/")).to route_to("welcome#index")
expect(:get => "/").to route_to(:controller => "welcome")

#within a test this might be:
require "rails_helper"
describe "routes for Users", type: :controller do
  it "/users routes to the users controller" do
    expect(get("/users")).to route_to("users#index")
  end
end

# For standard RESTful routes, your Rspec file may look like below (when you use scaffolding, it would also create something like this under spec/routing/[controllername]spec.rb)
require "rails_helper"
describe BlogsController, type: :controller do
  describe "routing" do
    it "routes to #index" do
      expect(get("/blogs")).to route_to("blogs#index")
    end
    it "routes to #new" do
      expect(get("/blogs/new")).to route_to("blogs#new")
    end
    it "routes to #show" do
      expect(get("/blogs/1")).to route_to("blogs#show", :id => "1")
    end
    it "routes to #edit" do
      expect(get("/blogs/1/edit")).to route_to("blogs#edit", :id => "1")
    end
    it "routes to #create" do
      expect(post("/blogs")).to route_to("blogs#create")
    end
    it "routes to #update" do
      expect(put("/blogs/1")).to route_to("blogs#update", :id => "1")
    end
    it "routes to #destroy" do
      expect(delete("/blogs/1")).to route_to("blogs#destroy", :id => "1")
    end
  end
end

### Capybara methods ...
require 'rails_helper'
feature "cheat sheet" do
  scenario "navigation" do
    visit new_user_path
    visit "/users/new"
    visit user_path(user_instance) #for show page
  end
  scenario "clicking" do
    click_button "id-of-button or text-of-button"
    click_link "id-of-link or text-of-button"
    click "id-or-text-of-button-or-link"
  end
  scenario "filling our forms" do
    fill_in "id-or-name-of-input", with: "oscar"
    choose "id-or-name-of-radio-button"
    check "id-or-name-of-checkbox"
    select('Option', :from => 'Select Box')
    click_button "id-or-value-of-submit-button"
  end
  scenario "expectation" do
    expect(page).to have_content "content on page"
    expect(page).to_not have_content "content shouldn't be on page"
    expect(current_path).to eq("/expected/path")
  end
end

# In general, test *features* rather than *controllers*
# controllers are usually pretty simple, bc "fat models, skinny controllers"
# times you might want to check a controller:
  # Checking for permissions, if necessary
  # Handling any errors, if they affect the response
  # Directly testing a critical component of your app, that involves a Controller
