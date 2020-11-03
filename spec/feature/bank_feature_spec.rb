require_relative '../../lib/account.rb'
describe Account do

  it 'deposits an amount, withdraws twice and prints statement' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.display_balance).to include("date || credit || debit || balance")
    expect(account.display_balance).to include("2500")
    expect(account.display_balance).to include("2000")
    expect(account.display_balance).to include("500")
  end
  it 'sorts the transactions by date' do
    account = Account.new
    account.deposit(1000, '03/01/2020')
    account.deposit(2000, '01/01/2001')
    account.deposit(1000, '03/01/1999')
    account.deposit(2000, '02/02/2019')
    expect(account.display_balance).to eq ("date || credit || debit || balance\n03/01/2020 ||  || 1000.00 || 1000.00\n02/02/2019 ||  || 2000.00 || 6000.00\n01/01/2001 ||  || 2000.00 || 3000.00\n03/01/1999 ||  || 1000.00 || 4000.00\n")
  end
end