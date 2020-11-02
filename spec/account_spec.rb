require 'account.rb'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'increases the balance by the amount deposited' do
    @account.deposit(1000)
    expect(@account.balance).to eq(1000)
  end

  it 'decreases the balance by the amount withdrawn' do
    @account.deposit(1000)
    @account.withdraw(500)
    expect(@account.balance).to eq(500)
  end
  it 'transaction items get added to history' do
    @account.deposit(1000)
    @account.withdraw(500)
    expect(@account.history.length).to eq(2)
  end
end
