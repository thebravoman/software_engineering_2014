require './examples'
require "net/http"
require "uri"

describe Examples do
	it "gets http request" do
		response = double('response')
		allow(response).to receive(:body).and_return("Some body")
		
		allow(Net::HTTP).to receive(:get_response).and_return(response)
		
		e = Examples.new
		e.get_index_page
	end
	
	it "format current time" do
		e = Examples.new
		time = Time.new(2015,01,01)
		allow(Time).to receive(:now).and_return(time)
		
		result = e.format_current_time
		expect(result).to eq("01/01/2015")
	end
	
	
end
