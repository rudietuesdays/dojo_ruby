require_relative 'apple_tree'

RSpec.describe AppleTree do
  before(:each) do
    @tree = AppleTree.new()
  end

  context 'no matter how old, the apple tree should...' do
    it 'have a getter and setter attribute of age' do
      @tree.age = 2
      expect(@tree.age).to eq(2)
    end
    it 'have only a getter attribute for height and apple count' do
      expect(@tree.height).to eq(0)
      expect(@tree.apple_count).to eq(0)
      expect{@tree.height = 3}.to raise_error(NoMethodError)
      expect{@tree.apple_count = 20}.to raise_error(NoMethodError)
    end
  end

  context 'up to the age of three (3)...' do
    it 'not be able to grow apples at this age' do
      expect{@tree.year_gone_by}.to raise_error("This tree has some growing to do before it can grow apples...")
    end
  end

  context 'between the ages of three (3) and seven (7)...' do
    it 'grow apples and be able to pick them' do
      @tree.age = 3
      @tree.year_gone_by
      expect(@tree.apple_count).to eq(2)
    end
  end

  context 'above the age of seven (7)...' do
    it 'is too old to grown apples' do
      @tree.age = 7
      expect{@tree.year_gone_by}.to raise_error("This old tree won't be growing more apples.")
    end
  end
end

################## OR #################
# require_relative "apple_tree"
#
# RSpec.describe AppleTree do
#   before(:each) do
#     @tree = AppleTree.new
#   end
#
#   it "should have an age attribute with getter and setter methods" do
#     @tree.age = 100
#     expect(@tree.age).to eq(100)
#   end
#
#   it "should have a getter for the height attribute" do
#     expect(@tree.height).to eq(10)
#   end
#
#   it "should raise a NeMethodError when setting the height attribute" do
#     expect{ @tree.height = 1 }.to raise_error(NoMethodError)
#   end
#
#   it "should have a getter for the apple_count attribute" do
#     expect(@tree.apple_count).to eq(0)
#   end
#
#   it "should raise a NeMethodError when setting the apple_count attribute" do
#     expect{ @tree.apple_count = 1 }.to raise_error(NoMethodError)
#   end
#
#   context "should have a method year_gone_by" do
#     before(:each) do
#       @tree.year_gone_by
#     end
#
#     it "adds one year to the age attribute" do
#       expect(@tree.age).to eq(1)
#     end
#
#     it "increases the height by 10% of it's current height" do
#       expect(@tree.height).to eq(11)
#     end
#
#     context "increases the apple count by 2 within a range" do
#       it "should not increase if the age is less than or equal to 3" do
#         # current age is 3 since the before(:each) in the parent context
#         2.times { @tree.year_gone_by }
#         expect(@tree.apple_count).to eq(0)
#       end
#
#       it "should increase if the age is between 4 and 10" do
#         # current age is 5 since the before(:each) in the parent context
#         4.times { @tree.year_gone_by }
#         expect(@tree.apple_count).to eq(4)
#       end
#
#       it "shound not increase if the age is greater than 10" do
#         # current age is 11 since the before(:each) in the parent context
#         10.times { @tree.year_gone_by }
#         expect(@tree.apple_count).to eq(14)
#       end
#     end
#
#     it "should have a method called pick_apples that takes all apples of the tree" do
#       @tree.pick_apples
#       expect(@tree.apple_count).to eq(0)
#     end
#   end
# end