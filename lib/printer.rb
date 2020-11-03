# frozen_string_literal: true
require 'date'

class Printer
  def initialize
    @header = "date || credit || debit || balance\n"
    @statement_array = []
    @statement_array << @header
  end


  def print(history)
    
    sort_array(history).each do |transaction|
      @statement_array << format_array(transaction)
    end
    puts @statement_array.join
    @statement_array.join
    
  end
  def format_array(transaction)
    transaction.deposit == nil ? deposit = "" : deposit = '%.2f' % transaction.deposit 
    transaction.debit == nil ? debit = "" : debit = '%.2f' % transaction.debit
    balance = '%.2f' % transaction.balance
    "#{transaction.date} || #{deposit} || #{debit} || #{balance}\n"
  end

  def sort_array(history)
    history.sort_by { |s| Date.strptime(s.date, '%d/%m/%Y') }.reverse
  end

end
