require_relative 'bank_account'

RSpec.describe BankAccount do
  before(:each) do
    account1 = BankAccount.new('rae', 100, 500)
  end

  it 'has a getter method for retrieving the checking account balance' do
    expect{@account1.checking_balance}.to eq(100)
  end
end

#
#
# RSpec.describe Person do
#   it "can't initialize user without name" do
#     expect{Person.new}.to raise_error(ArgumentError)
#   end
#
#   it "can't change users name" do
#     user = Person.new "Oscar"
#     expect{user.name = "Eduardo"}.to raise_error(NoMethodError)
#   end
# end
