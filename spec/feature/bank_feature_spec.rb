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
    account.deposit(0, '03/01/2020')
    account.deposit(0, '01/01/2001')
    account.deposit(0, '03/01/1999')
    account.deposit(0, '02/02/2019')
    expect(account.display_balance).to eq ("date || credit || debit || balance\n03/01/2020 ||  || 0.00 || 0.00\n02/02/2019 ||  || 0.00 || 0.00\n01/01/2001 ||  || 0.00 || 0.00\n03/01/1999 ||  || 0.00 || 0.00\n")
  end
end