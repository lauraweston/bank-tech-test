class Account
  def initialize
    @pounds = 0
    @pence = 0
  end

  def balance
    pence = @pence.to_s.rjust(2, "0")
    "#{@pounds}.#{pence}"
  end
end
