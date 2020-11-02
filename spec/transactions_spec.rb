# frozen_string_literal: true

require 'transactions'

describe Transactions do
  it 'returns todays date' do
    date = Time.now.strftime('%d/%m/%Y')
    transaction = Transactions.new(true, 100, 100)
    expect(transaction.date).to eq(date)
  end
end
