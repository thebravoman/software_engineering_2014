require './calculator.rb'

describe "Calculator" do
	
	before :each do
		@calc = Calculator.new
	end
	
	it "sums two numbers" do
		expect {
			@calc.plus(1,2)
		} == 3
	end
	
	it "sums two other numbers" do
		expect {
			@calc.plus(1,3)
		} == 4
	end

end
