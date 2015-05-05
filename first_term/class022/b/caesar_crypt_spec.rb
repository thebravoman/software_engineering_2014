require_relative "caesar_crypt"

describe "CaesarCrypt" do
	
	before :each do
		@cc = CaesarCrypt.new
	end

	it "transfers ab to bc" do
		expect(@cc.crypt("ab")).to eq("bc")
	end
	
	it "transfers z to a" do
		expect(@cc.crypt("az")).to eq("ba")
	end
	
end
