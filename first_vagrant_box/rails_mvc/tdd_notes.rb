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

### RSpec Expectations

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
ninja.should be_happyCopy
