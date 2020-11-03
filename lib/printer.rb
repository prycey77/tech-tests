# frozen_string_literal: true

require 'date'

class Printer
  def initialize(history, option)
    @history = history
    @option = option
    @header = "date || credit || debit || balance\n"
    @statement_array = []
    @balance = 0
  end

  def print
    sort_array.each do |transaction|
      @statement_array << format_array(transaction)
    end
    @statement_array << @header
    @statement_array.reverse!
    puts @statement_array.join
  end

  private

  def format_array(transaction)
    date = if @option.to_s.include?('1')
             date_option(transaction)
           else
             transaction.date
           end
    deposit = transaction.deposit.nil? ? '' : '%.2f' % transaction.deposit
    debit = transaction.debit.nil? ? '' : '%.2f' % transaction.debit
    transaction.debit.nil? ? @balance += transaction.deposit : @balance -= transaction.debit
    "#{date} || #{deposit} || #{debit} || #{format('%.2f', @balance)}\n"
  end

  def sort_array
    @history.sort_by { |s| Date.strptime(s.date, '%d/%m/%Y') }
  end

  def date_option(transaction)
    date = transaction.date.split('/')
    date[0], date[1] = date[1], date[0]
    date.join('/')
  end
end
