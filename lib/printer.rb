# frozen_string_literal: true

class Printer
  def initialize
    @header = " || date || credit || debit || balance\n"
    @statement_array = []
    @statement_array << @header
  end


  def print(history)
    
    history.reverse.each do |transaction|
      @statement_array << transaction.date
      transaction.deposit == nil ? @statement_array << "" : @statement_array << '%.2f' % transaction.deposit
      transaction.debit == nil ? @statement_array << "" : @statement_array << '%.2f' % transaction.debit
      @statement_array << '%.2f' % transaction.balance                  
      @statement_array << "\n"
    end
    puts@statement_array.join(" || ")
    @statement_array.join(" || ")
    
  end

end
