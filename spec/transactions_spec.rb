# frozen_string_literal: true

require 'timecop'
require 'transactions'

describe Transactions do
  before do
    Timecop.freeze(Time.now)
  end
  after do
    Timecop.return
  end

  it 'returns todays date' do
    date = Time.now.strftime('%d/%m/%Y')
    transaction = Transactions.new(nil, 100, date)
    expect(transaction.date).to eq(date)
  end

  it 'returns a debit amount' do
    transaction = Transactions.new(nil, 100, '03/11/2020')
    expect(transaction.debit).to eq(100)
  end

  it 'returns a deposit amount' do
    transaction = Transactions.new(150, nil, '03/11/2020')
    expect(transaction.deposit).to eq(150)
  end
end
