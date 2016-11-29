class Credit
  attr_reader :amount, :time
  
  def initialize(amount, time)
    @amount = amount
    @time = time
  end
end
