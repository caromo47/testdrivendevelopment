require_relative "apple_tree"

RSpec.describe AppleTree do
	before(:each) do
		@tree = AppleTree.new
	end

	it "should have an age attribute with getter and setter method" do
		@tree.age = 100
		expect(@tree.age).to eq(100)
	end

	it "should have a getter for height attribute" do
		expect(@tree.height).to eq(10)
	end

	it "should raise a NeMethodError when setting the height attribute" do
    expect{ @tree.height = 420 }.to raise_error(NoMethodError)
  end

	it "should have a getter attr for apple_count attribute" do
		expect(@tree.apple_count).to eq(0)
	end

	it "should raise a MethodError when setting the apple_count attribute" do
		expect{ @tree.apple_count = 1 }.to raise_error(NoMethodError)
	end

	context "should have a method year_gone_by" do
		before(:each) do
			@tree.year_gone_by
		end

		it "adds one year to the age attribute" do
			expect(@tree.age).to eq(1)
		end

		it "should increase if the height by 10% of its current height" do
			expect(@tree.height).to eq(11)
		end

		context "increases the apple count by 2 within range" do
			it "should not increase if the age is less than or equal to 3" do
				#current age is 3 since the before(:each) in parent context
				2.times { @tree.year_gone_by }
				expect(@tree.apple_count).to eq(0)
			end

			it "should increase if the age is between 4 and 10" do
				# current age is 5 since the before(:each) in the parent context (added 2)
				4.times { @tree.year_gone_by }
				expect(@tree.apple_count).to eq(4)
			end

			it "Should not increase if the age is greater than 10" do
				#current age is 11 since the before(:each) in the parent context(tested every number to 10)has to eq to 14
				10.times { @tree.year_gone_by }
				expect(@tree.apple_count).to eq(14)
			end
		end

		it "should have a method called pick_apples that takes all apples of the tree" do
			@tree.pick_apples
			expect(@tree.apple_count).to eq(0)
		end
	end
end
