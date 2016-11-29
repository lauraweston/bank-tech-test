require_relative "../lib/credit"

describe Credit do
  let(:time) { Time.new(2012, 10, 1) }
  subject(:credit) { described_class.new(1000, time) }

  it "initializes with a given amount" do
    expect(credit.amount).to eq 1000
  end
  it "initializes with a given date" do
    expect(credit.time).to eq time
  end
end
