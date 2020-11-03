# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'printer.rb'

class Account
  attr_accessor :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(deposit, date = (Time.now).strftime('%d/%m/%Y'))
    @balance += deposit
    @history << Transactions.new(deposit, nil, @balance, date)
  end

  def withdraw(debit, date = (Time.now).strftime('%d/%m/%Y'))
    @balance -= debit
    @history << Transactions.new(nil,debit, @balance, date)
  end

  def display_balance(printer = Printer.new)
    printer.print(@history)
  end
end
