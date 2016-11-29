class Account
  def initialize
    @pounds = 0
    @pence = 0
  end

  def balance
    pennies = pence.to_s.rjust(2, "0")
    "#{pounds}.#{pennies}"
  end

  private
  attr_reader :pounds, :pence
end
