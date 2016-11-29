require_relative "../lib/debit"

describe Debit do
  subject(:debit) { described_class.new(1000) }

  it "initializes with a given amount" do
    expect(debit.amount).to eq -1000
  end
  
  it "initializes with the current date" do
    time = Time.new(2012, 10, 1)
    allow(Time).to receive(:now).and_return(time)
    expect(debit.time).to eq time
  end
end
