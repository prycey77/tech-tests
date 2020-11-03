# frozen_string_literal: true

class Transactions
  attr_accessor :deposit, :debit, :date, :type

  def initialize(deposit, debit, date)
    @deposit = deposit
    @debit = debit
    @date = date
  end
end
