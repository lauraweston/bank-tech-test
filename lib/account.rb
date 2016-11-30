
class Account
  attr_reader :transactions

  def initialize(credit, debit, print_statement)
    @transactions = []
    @credit = credit
    @debit = debit
    @print_statement = print_statement
  end

  def balance
    "£#{format_pence(calculate_balance)}"
  end

  def deposit(amount)
    deposited_pence = convert_to_pence(amount)
    transaction = credit.new(deposited_pence)
    update_transactions(transaction)
  end

  def withdraw(amount)
    withdrawn_pence = convert_to_pence(amount)
    if withdrawn_pence > calculate_balance
      raise "Insufficient funds: available balance #{balance}"
    end
    transaction = debit.new(withdrawn_pence)
    update_transactions(transaction)
  end

  def statement
    print_statement.new(transactions).execute
  end

  private
  attr_reader :pence, :credit, :debit, :print_statement

  def convert_to_pence(amount)
    amount.delete(".").to_i
  end

  def format_pence(pence)
    pence.to_s.rjust(3, "0").insert(-3, ".")
  end

  def calculate_balance
    transactions.reduce(0) { |balance, transaction| balance + transaction.amount }
  end

  def update_transactions(transaction)
    @transactions << transaction
  end
end
