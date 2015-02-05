require "./subtitles_parser.rb"

describe "SubtitlesParser" do

	it "gets transcription" do
		content = "
1
00:00:04,096 --> 00:00:05,060
Hands in the air!
"
		parser = SubtitlesParser.new(content)
		expect(parser.transcript).to eq "Hands in the air!"
	end
	
	it "gets another transcription" do
		content = "
3
00:00:06,157 --> 00:00:07,962
Get on the ground!
"
		parser = SubtitlesParser.new(content)
		expect(parser.transcript).to eq "Get on the ground!"
	end
	
end
