class Transactions
  attr_reader :date
  def initialize(amount, balance, date = (Time.now).strftime('%d/%m/%Y'))
    @amount = amount
    @balance = balance
    @date = date

  end
end
