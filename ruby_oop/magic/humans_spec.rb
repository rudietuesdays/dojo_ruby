require_relative 'humans.rb'

Rspec.describe Human do
  before(:each) do
    human = Human.new("Minh Is Lame")
  end

  it "has the attribute strength" do
    expect(human.strength).to eq(true)
  end
  it "has the attribute intelligence" do
    expect(human.intelligence).to eq(true)
  end
  it "has the attribute stealth" do
    expect(human.stealth).to eq(true)
  end
  it "has the attribute health" do
    expect(human.health).to eq(true)
  end

  it "has a strength of 3" do
    human.strength.should eq(3)
  end

  it "has an intelligence of 3" do
    human.intelligence.should eq(3)
  end

  it "has a stealth of 3" do
    human.stealth.should eq(3)
  end

  it "has a health of 100" do
    human.health.should eq(100)
  end

  it "can attack another object" do
    human2 = Human.new("Frank")
    expect(human.attack).not_to raise_error(NoMethodError)
    human.attack(human2)
    human2.health.should be < 100
  end

end
