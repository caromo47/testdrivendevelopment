require_relative 'bankAccount'

RSpec.describe(:each) do
	before(:each) do
		@acc = BankAccount.new
	end

	it "Has a getter method for retrieving the checking account balance" do
		expect(@acc.checking).to eq(0)
	end

	it "Has a getter method that retrieves the total account balance" do
		expect(@acc.total).to eq("Checking Balance: 0\nSaving Balance: 0\nTotal Balance: 0")
	end

	context "withdrawing money" do
		it "Raises an error if a user tries to withdraw more money than they have in their checkings" do
			expect{ @acc.withdrawal("checking", 100) }.to raise_error("Insufficient Funds, you have 0 in this account")
		end

		it "raises an error if a user tries to withdraw more money than they have in their savings" do
			expect { @acc.withdrawal("savings", 100) }.to raise_error("Insufficient Funds, you have 0 in this account")
		end
	end

	it "raises an error when the user attempts to retrieve the total number of bank accounts" do
		expect{ @acc.number_of_accounts }.to raise_error(NoMethodError)
	end

	it "raises an error when the user attempts to set the interest rate" do
    expect{ @acc.interest_rate }.to raise_error(NoMethodError)
  end

end
