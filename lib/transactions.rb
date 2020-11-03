# frozen_string_literal: true

class Transactions
  attr_accessor :deposit, :debit, :balance, :date, :type

  def initialize(deposit, debit, balance, date = (Time.now).strftime('%d/%m/%Y'))
    @deposit = deposit
    @debit = debit
    @balance = balance
    @date = date
  end
end
