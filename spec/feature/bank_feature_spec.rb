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
end