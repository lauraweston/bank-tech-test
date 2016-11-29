require_relative "../lib/account"

describe Account do
  it "initializes with a balance of zero" do
    account = Account.new
    expect(account.balance).to eq "0.00"
  end
end
