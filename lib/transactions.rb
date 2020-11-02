# frozen_string_literal: true

class Transactions
  attr_accessor :amount, :balance, :date, :type

  def initialize(type, amount, balance, date = (Time.now).strftime('%d/%m/%Y'))
    @type = type
    @amount = amount
    @balance = balance
    @date = date
  end
end
