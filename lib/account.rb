# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'printer.rb'

class Account
  attr_accessor :history
  def initialize
    @history = []
  end

  def deposit(deposit, date = nil)   
    @history << Transactions.new(deposit, nil, datetime(date))
  end

  def withdraw(debit, date = nil)
    @history << Transactions.new(nil, debit, datetime(date))
  end

  def display_balance(option = 0)
    printer = Printer.new(@history, option)
    printer.print
  end
private
  def datetime(date)
    date.nil? ? Time.now : Time.parse(date)
  end
end
