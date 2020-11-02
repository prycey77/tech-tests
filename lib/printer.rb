class Printer
  def self.print(history)
    statement = "date    || credit || debit || balance\n"
    history.each do |transaction|
      statement += transaction.date + ' || '
      statement += if transaction.type == true
                     transaction.amount.to_s + ' ||  || '
                   else
                     ' ||   || ' + transaction.amount.to_s
                   end
      puts statement += transaction.balance.to_s + "\n"
    end
    statement
  end
end
