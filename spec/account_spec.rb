require_relative "../lib/account"
# require_relative "../lib/credit"
# require_relative "../lib/debit"

describe Account do
  let(:credit_class) { double :credit_class }
  let(:debit_class) { double :debit_class }
  subject(:account) { described_class.new(credit_class, debit_class) }

  before :each do
    allow(credit_class).to receive(:new)
  end

  it "initializes with a balance of zero" do
    expect(account.balance).to eq "£0.00"
  end

  describe "statement" do
    it "stores the transaction history" do
      expect(account.transactions).to eq []
    end
  end

  describe "depositing" do
    context "initial balance is zero" do
      let(:credit_instance) { double :credit_instance }

      it "changes the balance by the deposited amount" do
        account.deposit("10.50")

        expect(account.balance).to eq "£10.50"
      end

      it "creates a new instance of Credit" do
        expect(credit_class).to receive(:new).with(1050)
        account.deposit("10.50")
      end

      it "adds the Credit instance to the transactions list" do
        allow(credit_class).to receive(:new).with(1050).and_return(credit_instance)
        account.deposit("10.50")

        expect(account.transactions.length).to eq 1
        expect(account.transactions.last).to eq credit_instance
      end
    end

    context "initial balance is greater than zero" do
      it "changes the balance by the deposited amount" do
        account.deposit("10.50")
        account.deposit("5.75")

        expect(account.balance).to eq "£16.25"
      end
    end
  end

  describe "withdrawing" do
    let(:debit_instance) { double :debit_instance }

    before :each do
      allow(debit_class).to receive(:new)
      account.deposit("10.00")
    end

    context "initial balance is greater than zero" do
      it "reduces the balance by the withdrawn amount" do
        account.withdraw("4.25")

        expect(account.balance).to eq "£5.75"
      end

      it "allows withdrawals of full remaining balance" do
        account.withdraw("10.00")

        expect(account.balance).to eq "£0.00"
      end

      it "creates a new instance of Debit" do
        expect(debit_class).to receive(:new).with(550)
        account.withdraw("5.50")
      end

      it "adds the Debit instance to the transactions list" do
        allow(debit_class).to receive(:new).with(550).and_return(debit_instance)
        account.withdraw("5.50")

        expect(account.transactions.length).to eq 2
        expect(account.transactions.last).to eq debit_instance
      end
    end

    context "withdrawal amount is greater than account balance" do
      it "does not allow the amount to be withdrawn" do
        expect { account.withdraw("10.50") }.to raise_error "Insufficient funds: available balance £10.00"
        expect(account.balance).to eq "£10.00"
      end
    end
  end
end
