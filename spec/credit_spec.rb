require_relative "../lib/credit"

describe Credit do
  subject(:credit) { described_class.new(1000) }

  it "initializes with a given amount" do
    expect(credit.amount).to eq 1000
  end
  it "initializes with the current date" do
    time = Time.new(2012, 10, 1)
    allow(Time).to receive(:now).and_return(time)
    expect(credit.time).to eq time
  end
end
