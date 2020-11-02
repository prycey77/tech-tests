require 'account.rb'

describe Account do
  it 'increases the balance by the amount deposited' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq(1000)
    end

    it 'decreases the balance by the amount withdrawn' do
      account = Account.new
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq(500)
    end

end