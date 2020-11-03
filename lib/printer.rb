# frozen_string_literal: true

class Printer
  def print(history)
    statement = "date    || credit || debit || balance\n"
    history.reverse.each do |transaction|
      statement += transaction.date + ' || '
      statement += if transaction.type == true
                     transaction.amount.to_s + ' ||  || '
                   else
                     ' ||   || ' + transaction.amount.to_s + ' || '
                   end
      puts statement += transaction.balance.to_s + "\n"
    end
    statement
  end
end
