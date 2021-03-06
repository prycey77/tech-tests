# frozen_string_literal: true

require 'date'

class Printer
  def initialize(history, option)
    @history = history
    @option = option
    @balance = 0
  end

  def print
    header = "date || credit || debit || balance\n"
    statement_array = []
    sort_array.each do |transaction|
      statement_array << format_array(transaction)
    end
    statement_array << header
    statement_array.reverse!
    puts statement_array.join
  end

  private

  def format_array(transaction)
    date = date_option(transaction)
    deposit = transaction.deposit.nil? ? '' : " #{'%.2f' % transaction.deposit} ||"
    debit = transaction.debit.nil? ? '||' : "|| #{'%.2f' % transaction.debit} ||"
    transaction.debit.nil? ? @balance += transaction.deposit : @balance -= transaction.debit
    "#{date} ||#{deposit} #{debit} #{format('%.2f', @balance)}\n"
  end

  def sort_array
    @history.sort_by(&:date)
  end

  def date_option(transaction)
    @option.to_s.include?('1') ? transaction.date.strftime('%m/%d/%Y') : transaction.date.strftime('%d/%m/%Y')
  end
end
