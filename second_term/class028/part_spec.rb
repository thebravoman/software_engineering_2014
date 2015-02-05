require './part.rb'

describe "Part" do

	it "moves" do
		content = "1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!
"
		part = Part.new(content)
		part.move 1000
		expect(part.start).to eq 5096
		expect(part.finish).to eq 6060
	end
	
	it "gets start" do 
		content = "1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!
"
		part = Part.new(content)
		expect(part.start).to eq 4096
	end
	
	it "gets finish" do 
		content = "1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!
"
		part = Part.new(content)
		expect(part.finish).to eq 5060
	end
	
	it "gets multiline transcript" do
		content = "1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!
"
		parser = Part.new(content)
		expect(parser.transcript).to eq "Hands in the air! don't turn around!"
	end
	
end
