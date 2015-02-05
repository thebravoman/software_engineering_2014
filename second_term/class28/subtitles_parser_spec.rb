require "./subtitles_parser.rb"

describe "SubtitlesParser" do

	it "gets multiline transcript" do
		content = "
1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!
"
		parser = SubtitlesParser.new(content)
		expect(parser.transcript).to eq "Hands in the air! don't turn around!"
	end
	
	it "gets transcription" do
		content = "
1
00:00:04,096 --> 00:00:05,060
Hands in the air!
"
		parser = SubtitlesParser.new(content)
		expect(parser.transcript).to eq "Hands in the air!"
	end

end
