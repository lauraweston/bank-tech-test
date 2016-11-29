require_relative "../lib/account"

describe Account do
  subject(:account) { described_class.new }

  it "initializes with a balance of zero" do
    expect(account.balance).to eq "0.00"
  end

  describe "depositing" do
    context "initial balance is zero" do
      it "changes the balance by the deposited amount" do
        account.deposit("10.50")
        expect(account.balance).to eq "10.50"
      end
    end
    context "initial balance is greater than zero" do
      it "changes the balance by the deposited amount" do
        account.deposit("10.50")
        account.deposit("5.75")
        expect(account.balance).to eq "16.25"
      end
    end
  end
end
