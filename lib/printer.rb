# frozen_string_literal: true

class Printer
  def initialize
    @header = "|| date || credit || debit || balance\n"
    @statement_array = []
    @statement_array << @header
  end


  def print(history)
    
    history.reverse.each do |transaction|
      @statement_array << transaction.date
      @statement_array << transaction.deposit
      @statement_array << transaction.debit
      @statement_array << transaction.balance                  
      @statement_array << "\n"
    end
    puts@statement_array.join(" || ")
    @statement_array.join(" || ")
    
  end

end
