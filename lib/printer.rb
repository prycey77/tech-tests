# frozen_string_literal: true

class Printer
  def print(history)
    statement = "date    || credit || debit || balance\n"
    history.reverse.each do |transaction|
      statement += transaction.date + ' || '
      statement += if transaction.type == true
                      '%.2f' % transaction.amount+ ' ||  || '
                   else
                      ' ||   || ' + '%.2f' % transaction.amount + ' || '
                   end
      puts statement += '%.2f' % transaction.balance + "\n"
    end
    statement
  end
end
