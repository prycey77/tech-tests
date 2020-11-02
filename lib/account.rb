require 'transactions'

class Account
  attr_accessor :balance
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
    @history << Transactions.new(amount, @balance)
  end
  
  def withdraw(amount)
    @balance -= amount
  end
  
end