# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'printer.rb'

class Account
  attr_accessor :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(deposit, date = Time.now)
    @balance += deposit
    @history << Transactions.new(nil, deposit, @balance)
  end

  def withdraw(debit)
    @balance -= debit
    @history << Transactions.new(debit, nil, @balance)
  end

  def display_balance(printer = Printer.new)
    printer.print(@history)
  end
end
