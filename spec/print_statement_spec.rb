require_relative "../lib/print_statement.rb"

describe PrintStatement do
  it "prints a statement header" do
    blank_statement = PrintStatement.new
    expect(STDOUT).to receive(:puts).with("date       || credit  || debit   || balance")
    blank_statement.execute
  end

  it "prints a list of transactions" do
    allow(Time).to receive(:now).and_return(Time.new(2012, 1, 10))
    credit_1 = Credit.new(100000)
    allow(Time).to receive(:now).and_return(Time.new(2012, 1, 13))
    credit_2 = Credit.new(200000)
    allow(Time).to receive(:now).and_return(Time.new(2012, 1, 14))
    debit = Debit.new(50000)

    statement = PrintStatement.new([credit_1, credit_2, debit])

    expect(STDOUT).to receive(:puts).with("date       || credit  || debit   || balance")
    expect(STDOUT).to receive(:puts).with("14/01/2012 ||         || 500.00  || 2500.00")
    expect(STDOUT).to receive(:puts).with("13/01/2012 || 2000.00 ||         || 3000.00")
    expect(STDOUT).to receive(:puts).with("10/01/2012 || 1000.00 ||         || 1000.00")
    statement.execute
  end
end
