require_relative "caesar_crypt"

describe "CaesarCrypt" do
	
	it "transfer a to b" do
		cc = CaesarCrypt.new
		expect(cc.crypt("a")).to eq("b")
	end
	
	
	
end
