require_relative "../lib/account"

describe Account do
  subject(:account) { described_class.new }

  it "initializes with a balance of zero" do
    expect(account.balance).to eq "0.00"
  end

  describe "statement" do
    it "stores the transaction history" do
      expect(account.transactions).to eq []
    end
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

    describe "withdrawing" do
      context "initial balance is greater than zero" do
        it "reduces the balance by the withdrawn amount" do
          account.deposit("10.00")
          account.withdraw("4.25")

          expect(account.balance).to eq "5.75"
        end
        it "allows withdrawals of full remaining balance" do
          account.deposit("10.34")
          account.withdraw("10.34")

          expect(account.balance).to eq "0.00"
        end
      end

      context "withdrawal amount is greater than account balance" do
        it "does not allow the amount to be withdrawn" do
          account.deposit("5.00")

          expect { account.withdraw("10.00") }.to raise_error "Insufficient funds: available balance £5.00"
          expect(account.balance).to eq "5.00"
        end
      end
    end
  end
end
