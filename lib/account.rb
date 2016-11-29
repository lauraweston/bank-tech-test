
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
    @pence += deposited_pence
    @transactions << credit.new(deposited_pence)
  end

  def withdraw(amount)
    withdrawn_pence = convert_to_pence(amount)
    if pence >= withdrawn_pence
      @pence -= withdrawn_pence
      @transactions << debit.new(withdrawn_pence)
    else
      raise "Insufficient funds: available balance #{balance}"
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
end
