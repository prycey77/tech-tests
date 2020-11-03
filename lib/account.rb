# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'printer.rb'

class Account
  attr_accessor :history
  def initialize
    @history = []
  end

  def deposit(deposit, date = (Time.now).strftime('%d/%m/%Y'))
    @history << Transactions.new(deposit, nil, date)
  end

  def withdraw(debit, date = (Time.now).strftime('%d/%m/%Y'))
    @history << Transactions.new(nil, debit, date)
  end

  def display_balance(printer = Printer.new(@history, option = 0))
    printer.print
  end
end
