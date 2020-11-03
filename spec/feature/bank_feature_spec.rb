# frozen_string_literal: true

require_relative '../../lib/account.rb'
describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'deposits an amount, withdraws twice and prints statement' do
    @account.deposit(1000)
    @account.deposit(2000)
    @account.withdraw(500)
    printed = capture_stdout do
      @account.display_balance
    end
    expect(printed).to include('date || credit || debit || balance')
    expect(printed).to include('2500')
    expect(printed).to include('2000')
    expect(printed).to include('500')
  end
  it 'sorts the transactions by date' do
    @account.deposit(0, '03/01/2020')
    @account.deposit(0, '01/01/2001')
    @account.deposit(0, '03/01/1999')
    @account.deposit(0, '02/02/2019')
    printed = capture_stdout do
      @account.display_balance
    end
    expect(printed).to eq("date || credit || debit || balance\n03/01/2020 || 0.00 ||  || 0.00\n02/02/2019 || 0.00 ||  || 0.00\n01/01/2001 || 0.00 ||  || 0.00\n03/01/1999 || 0.00 ||  || 0.00\n")
  end
  it 'sorts transactions by date and adjusts balance' do
    @account.deposit(1500, '02/11/1989')
    @account.deposit(2500, '02/11/1979')
    @account.deposit(500)
    @account.deposit(500, '01/01/2019')
    printed = capture_stdout do
      @account.display_balance
    end
    expect(printed).to eq("date || credit || debit || balance\n03/11/2020 || 500.00 ||  || 5000.00\n01/01/2019 || 500.00 ||  || 4500.00\n02/11/1989 || 1500.00 ||  || 4000.00\n02/11/1979 || 2500.00 ||  || 2500.00\n")
  end
end
