class BankAccount
    @@users = 0
    attr_reader :checking_amt, :savings_amt, :balance, :acct_num
    def initialize(name, checking_amt, savings_amt)
        @name = name
        @checking_amt = checking_amt
        @savings_amt =  savings_amt
        @balance = checking_amt + savings_amt
        puts "Welcome to the bank, #{@name}!"
        @create_account = create_account
        puts "You have deposited $#{@checking_amt} in your checking account and $#{@savings_amt} in your savings account.\nYour total balance is $#{@balance}"
        @@users += 1
        puts "There are #{@@users} members at the bank."
        @@interest_rate = 0.01 # not accessible since there is no reader for it
    end

    def checking_balance
        puts "Your checking account balance is $#{@checking_amt}."
        self
    end

    def savings_balance
        puts "Your savings account balance is $#{@savings_amt}."
        self
    end

    def deposit(amount, account)
        if account.downcase == "savings"
            @savings_amt += amount
            puts "Transaction successful. Deposited $#{amount} into savings."
        elsif account.downcase == "checking"
            @checking_amt += amount
            puts "Transaction successful. Deposited $#{amount} into checking."
        else
            puts "Sorry, input is not valid. Please choose either \'checking\' or \'savings\' account."
        end
        self
    end

    def withdraw(amount, account)
        if account.downcase == "checking"
            if @checking_amt < amount
                puts "Insufficient funds"
            else
                @checking_amt -= amount
                puts "Transaction successful. $#{amount} withdrawn from checking."
            end
        elsif account.downcase == "savings"
            if @savings_amt < amount
                puts "Insufficient funds"
            else
                @savings_amt -= amount
                puts "Transaction successful. $#{amount} withdrawn from savings."
            end
        else
            puts "Sorry, input is not valid. Please choose either \'checking\' or \'savings\' account."
        end
        self
    end

    def acct_info
        puts " Account \##{@acct_num} \n Total balance: #{@balance} \n Checking account balance: #{@checking_amt} \n Savings account balance: #{@savings_amt} \n Interest rate: #{@@interest_rate}"
        self
    end

    private
        def create_account
            @acct_num = Random.rand(1000..9999)
            puts "Your account number is #{@acct_num}"
            self
        end
        ### OR...
        # def create_account
        #     Array.new(10).map { rand(1000..9999) }.join
        # end

end

member1 = BankAccount.new("rae", 50, 25)
member2 = BankAccount.new("lisa", 100, 250)
member1.acct_info
