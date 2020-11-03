# frozen_string_literal: true

require 'date'

class Printer
  def initialize
    @header = "date || credit || debit || balance\n"
    @statement_array = []
    @balance = 0
  end

  def print(history, option)
    sort_array(history).each do |transaction|
      @statement_array << format_array(transaction, option)
    end
    @statement_array << @header
    @statement_array.reverse!
    puts @statement_array.join
  end

  private

  def format_array(transaction, option)
    if option == 1
      date = transaction.date.split("/")
      date[0], date[1] = date[1],date[0]
      date = date.join('/')
    else
      date = transaction.date
    end

    deposit = transaction.deposit.nil? ? '' : '%.2f' % transaction.deposit
    debit = transaction.debit.nil? ? '' : '%.2f' % transaction.debit
    transaction.debit.nil? ? @balance += transaction.deposit : @balance -= transaction.debit
    "#{date} || #{deposit} || #{debit} || #{format('%.2f', @balance)}\n"
  end

  def sort_array(history)
    history.sort_by { |s| Date.strptime(s.date, '%d/%m/%Y') }
  end
end
