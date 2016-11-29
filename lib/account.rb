class Account
  def initialize
    @pence = 0
  end

  def balance
    balance = pence.to_s.rjust(3, "0").insert(-3, ".")
    "#{balance}"
  end

  def deposit(amount)
    deposited_pence = amount.delete(".").to_i
    @pence += deposited_pence
  end

  private
  attr_reader :pence
end
