class Account
  def initialize
    @pence = 0
  end

  def balance
    balance = pence.to_s.rjust(3, "0").insert(-3, ".")
    "#{balance}"
  end

  def deposit(amount)
    deposited_pence = convert_to_pence(amount)
    @pence += deposited_pence
  end

  def withdraw(amount)
    withdrawn_pence = convert_to_pence(amount)
    @pence -= withdrawn_pence
  end

  private
  attr_reader :pence

  def convert_to_pence(amount)
    amount.delete(".").to_i
  end
end
