require_relative 'humans'

RSpec.describe Human do
  before(:each) do
    @human = Human.new("Minh Is Lame")
  end

  it "has the attribute strength" do
    expect{@human.strength}.not_to raise_error
  end
  # OR...
  # it 'has a getter and setter attribute for strength' do
  #     human = Human.new
  #       expect{human.strength = 5}.to_not raise_error
  #     expect(human.strength).to eql(5)
  # end
  it "has the attribute intelligence" do
    expect{@human.intelligence}.not_to raise_error
  end
  it "has the attribute stealth" do
    expect{@human.stealth}.not_to raise_error
  end
  it "has the attribute health" do
    expect{@human.health}.not_to raise_error
  end

  it "has a strength of 3" do
    expect(@human.strength).to eq(3)
  end

  it "has an intelligence of 3" do
    expect(@human.intelligence).to eq(3)
  end

  it "has a stealth of 3" do
    expect(@human.stealth).to eq(3)
  end

  it "has a health of 100" do
    expect(@human.health).to eq(100)
  end

  it "can attack another object" do
    @human2 = Human.new("Frank")
    expect{@human.attack(@human2)}.not_to raise_error
    @human.attack(@human2)
    expect(@human2.health).to be < 100
  end

  # OR ....

  # it 'has a default value for health, strength, intelligence and stealth' do
  #     human = Human.new
  #     expect(human.health).to eql(100)
  #     expect(human.strength).to eql(3)
  #     expect(human.intelligence).to eql(3)
  #     expect(human.stealth).to eql(3)
  # end
  # it 'has a method called attack' do
  #     human = Human.new
  #     expect{human.attack}.to_not raise_error(NoMethodError)
  # end
  # it 'attacks only when a human is passed as an argument' do
  #     human = Human.new
  #     human2 = Human.new
  #     expect{human.attack}.to raise_error(ArgumentError)
  #     expect{human.attack(human2)}.to_not raise_error
  # end
  # it 'decreases health if attacked' do
  #     human = Human.new
  #     human2 = Human.new
  #     old_health = human2.health
  #     human.attack(human2)
  #     expect(human2.health).to be < old_health
  # end

end
