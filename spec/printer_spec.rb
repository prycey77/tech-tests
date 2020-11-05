# frozen_string_literal: true

require 'printer'
require 'transactions'

describe Printer do
  before do
    Timecop.freeze(Time.now)
    @datetime = Time.now
    @date = Time.now.strftime('%d/%m/%Y')
  end
  after do
    Timecop.return
  end

  it 'prints the statement header' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: Time.now)
    statement = [transaction]
    printer = Printer.new(statement, 0)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include 'date || credit || debit || balance'
  end

  it 'prints transactions' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: @datetime)
    statement = [transaction]
    printer = Printer.new(statement, 0)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include "#{@date} ||  || 0.00 || 0.00"
  end

  it 'prints American formatted dates when option selected' do
    transaction = instance_double(Transactions, deposit: nil, debit: 0, date: @datetime)
    statement = [transaction]
    american_date = @datetime.strftime('%m/%d/%Y')
    printer = Printer.new(statement, 1)
    printed = capture_stdout do
      printer.print
    end
    expect(printed).to include "#{american_date} ||  || 0.00 || 0.00"
  end
end
