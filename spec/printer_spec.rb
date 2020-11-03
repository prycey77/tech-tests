# frozen_string_literal: true

require 'printer'
require 'transactions'

describe Printer do
  before(:each) do
    @printer = Printer.new
  end

  it 'prints the statement header' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printed = capture_stdout do
      @printer.print(statement, 0)
    end
    expect(printed).to include 'date || credit || debit || balance'
  end

  it 'prints transactions' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printed = capture_stdout do
      @printer.print(statement, 0)
    end
    expect(printed).to include '01/11/2020 ||  || 0.00 || 0.00'
  end
  
  it 'prints American formatted dates when option selected' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: '01/11/2020')
    statement = [transaction]
    printed = capture_stdout do
      @printer.print(statement, 1)
    end
    expect(printed).to include '11/01/2020 ||  || 0.00 || 0.00'
  end
end
