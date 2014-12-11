class Bank
  attr_reader :accounts
  #There are also attr_writer and attr_accessor
  #Below is what "attr_reader :accounts" does
  #def accounts
  #  @accounts
  #end

  #There are also getters and setters
    #Getters read data (attr_reader)
    #Setters allows you to modify the variable (attr_writer)
    #attr_accessor GETS AND SETS!!!
	
  def initialize
		@accounts = []
	end

  def add_account
    accounts.push(Account.new)
    # initialize a new account and push it into account
  end

  def bank_balance
    accounts.map { |acct| acct.balance }.reduce(:+)
  end

  # method that asks for user credentials and gives options (deposit, withdrawal, create another account)
  # finds the account by last_name
  # calls Account.deposit, withdrawal, create new account
end

class Account
  attr_reader :owner, :balance

  def initialize
    @balance = 0
    # @tx_list = []
    #Eventually should take add_owner out of Account instantiation so Person object can have more than one acct
    add_owner
  end

  def add_owner
    puts "What is your first name?"
    first_name = gets.chomp
    puts "What is your last name?"
    last_name = gets.chomp
    @owner = Person.new(first_name, last_name)
  end

  def deposit
    puts "How much do you want to deposit?"
    deposit_amt = gets.chomp
    @balance += deposit_amt.to_i
    # find last tx in tx_list,

  end

  def withdrawal
    puts "How much do you want to deposit?"
    withdrawal_amt = gets.chomp
    @balance -= withdrawal_amt.to_i
  end

  def all_transactions
  end
end

class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    @first_name + " " + @last_name
  end
end

class Transation
  def initialize( amount, type, id )
    @timestamp = Time.now #outputs Date and Time
    
  end
end




bank = Bank.new
puts "Bank is open for business with: #{bank.accounts}!"
bank.add_account
puts "And we have our first client:  #{bank.accounts.first.owner.full_name}!"
bank.add_account
puts "Yay you made another account!"
puts bank.bank_balance
account1 = bank.accounts.first
account1_bal = account1.balance
account1.deposit
puts bank.accounts.first.balance



