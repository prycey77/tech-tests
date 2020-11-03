# frozen_string_literal: true

require 'printer'
require 'transactions'

describe Printer do
  it 'prints the statement header' do
    printer = Printer.new
    transaction = instance_double(Transactions, deposit: nil, debit: 100, date: '01/11/2020')
    statement = [transaction]
    expect(printer.print(statement)).to include 'date || credit || debit || balance'
  end

  it 'prints transactions' do
    printer = Printer.new
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    expect(printer.print(statement)).to include '01/11/2020 ||  || 0.00 || 0.00'
  end
end
