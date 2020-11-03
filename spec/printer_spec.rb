# frozen_string_literal: true

require 'printer'
require 'transactions'

describe Printer do

  it 'prints the statement header' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printer = Printer.new(statement, 0)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include 'date || credit || debit || balance'
  end

  it 'prints transactions' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printer = Printer.new(statement, 0)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include '01/11/2020 ||  || 0.00 || 0.00'
  end
  
  it 'prints American formatted dates when option selected' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printer = Printer.new(statement, 1)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include '11/01/2020 ||  || 0.00 || 0.00'
  end
end
