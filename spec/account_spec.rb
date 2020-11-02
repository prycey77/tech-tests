require 'account.rb'

describe Account do
  account = Account.new
  account.deposit(1000)
    it 'increases the balance by the amount deposited' do
      expect(account.balance).to eq(1000)
    end


end