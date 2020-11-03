# frozen_string_literal: true

require 'printer'
require 'transactions'

describe Printer do
  it 'prints transactions' do
    printer = Printer.new
    transaction = instance_double(Transactions, type: false, amount: 100, balance: 1000, date: '01-11-2020')
    statement = [transaction]
    expect(printer.print(statement)).to include '01-11-2020'
  end
end
