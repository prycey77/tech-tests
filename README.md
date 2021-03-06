# Bank tech test.  [![Build Status](https://travis-ci.org/prycey77/tech-tests.svg?branch=main)](https://travis-ci.org/prycey77/tech-tests)

#### Technologies: Ruby, Rspec

### [Makers Academy](https://makers.tech/) - Week 10 Solo Tech Test

#### Specification requirements:

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

```

User stories:

```
As a user
So that I can save money
I would like to deposit funds into my bank account
```

```
As a user
So that I can spend my hard earned money
I would like to be able to withdraw from my account
```

```
As a user
So that I can see my account history
I would like to print a statement with date of when
I deposited/withdrew money.
```

Extra user stories:

```
As a user, I may want to add in a transaction that was missing, by passing it with a date in the past (eg. account.deposit(50, ’03/08/2020’) or whatever date format makes sense for your code).
This should in turn readjust my statement so that the transaction shows in the right place, and the balances are still correct.
```

```
As a user that loves all things American
So that I can read the date in a format that I prefer
I would like to select an option to view the date in American format
```

#### To use:

```

$ bundle
$ irb

> load './lb/account'

```

```

account = Account.new
account.deposit(100) #deposit amount
account.withdraw(20) #withdraw amount
account.display_balance #displays recent transactions (dd/mm/yyyy)
account.display_balance(1) #displays recent transaction (mm/dd/yyyy)

```

#### Preview:

<img src='./images/bankgif.gif'>

#### To run Rspec tests:

```

$ rspec

```
