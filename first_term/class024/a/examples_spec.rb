require './examples'

describe Examples do 
	it "get site content" do
		response = double('response double')
		allow(response).to receive(:body).and_return("Some body")
		
		allow(Net::HTTP).to receive(:get_response).and_return(response)
		
		e = Examples.new
		e.get_site_content "http://lubo.elsys-bg.org"
		
	end
	
	it "formats current time" do
		current_time = Time.new(2015,01,01)
		allow(Time).to receive(:now).and_return(current_time)
		
		e = Examples.new
		result = e.format_current_time
		expect(result).to eq("01/01/2015")
	end
	
end
