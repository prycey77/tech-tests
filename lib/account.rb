# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'printer.rb'

class Account
  attr_accessor :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    @history << Transactions.new(true, deposit_amount, @balance)
  end

  def withdraw(withdraw_amount)
    @balance -= withdraw_amount
    @history << Transactions.new(false, withdraw_amount, @balance)
  end

  def display_balance(printer = Printer.new)
    printer.print(@history)
  end
end
