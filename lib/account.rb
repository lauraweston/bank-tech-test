
class Account
  attr_reader :transactions

  def initialize(credit, debit)
    @pence = 0
    @transactions = []
    @credit = credit
    @debit = debit
  end

  def balance
    "£#{convert_pence_to_balance}"
  end

  def deposit(amount)
    deposited_pence = convert_to_pence(amount)
    transaction = credit.new(deposited_pence)
    update_account(transaction)
  end

  def withdraw(amount)
    withdrawn_pence = convert_to_pence(amount)
    if withdrawn_pence > pence
      raise "Insufficient funds: available balance #{balance}"
    else
      transaction = debit.new(withdrawn_pence)
      update_account(transaction)
    end
  end

  private
  attr_reader :pence, :credit, :debit

  def convert_to_pence(amount)
    amount.delete(".").to_i
  end

  def convert_pence_to_balance
    pence.to_s.rjust(3, "0").insert(-3, ".")
  end

  def update_balance(amount)
    @pence += amount
  end

  def update_transactions(transaction)
    @transactions << transaction
  end

  def update_account(transaction)
    update_balance(transaction.amount)
    update_transactions(transaction)
  end
end
