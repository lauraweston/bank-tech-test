class PrintStatement
  def initialize(transactions = [])
    @transactions = transactions
  end

  def execute
    print_header
    format_transactions.reverse.each do |summary|
      puts summary
    end
    puts ""
  end

  private

  attr_reader :transactions

  def format_pence(amount)
    amount.to_s.rjust(3, "0").insert(-3, ".")
  end

  def print_header
    puts "#{'date'.ljust(11)}|| #{'credit'.ljust(8)}|| #{'debit'.ljust(8)}|| balance"
  end

  def format_transactions
    balance = 0
    transactions.map do |transaction|
      date = transaction.time.strftime("%d/%m/%Y")
      credit = transaction.class == Credit ? format_pence(transaction.amount) : ""
      debit = transaction.class == Debit ? debit = format_pence(-transaction.amount) : ""
      balance += transaction.amount
      "#{date.ljust(11)}|| #{credit.ljust(8)}|| #{debit.ljust(8)}|| #{format_pence(balance)}"
    end
  end
end
