require_relative 'bank_account'

RSpec.describe BankAccount do
  before(:each) do
    @account1 = BankAccount.new('rae', 100, 500)
  end

  it 'has a getter method for retrieving the checking account balance' do
    expect{@account1.checking_balance}.to output("Your checking account balance is $100.\n").to_stdout
  end

  it 'has a getter method that retrieves the total account balance' do
    expect{@account1.total_balance}.to output("Your total account balance is $600.\n").to_stdout
  end

  context 'withdraw funds' do
    it 'has a function that allows a user to withdraw cash' do
      expect{@account1.withdraw(50, 'checking')}.to output("Transaction successful. $50 withdrawn from checking.\n").to_stdout
      expect{@account1.withdraw(20, 'SAVINGS')}.to output("Transaction successful. $20 withdrawn from savings.\n").to_stdout
    end
    it 'raises an error if the user tries to withdraw more money than is in the account' do
      expect{@account1.withdraw(200, 'checking')}.to raise_error("Insufficient funds")
      expect{@account1.withdraw(800, 'savings')}.to raise_error("Insufficient funds")
    end
  end

  context 'not readable or writable attributes --' do
    it 'raises an error when the user attemps to retrieve the total number of bank accounts' do
      expect{@account1.total_accounts}.to raise_error(NoMethodError)
    end
    it 'raises an error when the user attempts to set the interest rate' do
      expect{@account1.interest_rate}.to raise_error(NoMethodError)
    end
  end
end
