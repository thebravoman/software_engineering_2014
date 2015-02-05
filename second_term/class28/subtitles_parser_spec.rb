require "./subtitles_parser.rb"

describe "SubtitlesParser" do

	it "gets multipart transcript" do
		content = "1
00:00:04,096 --> 00:00:05,060
Hands in the air!
don't turn around!

2
00:00:05,061 --> 00:00:06,155
Okay.
don't turn around!
"

		parser = SubtitlesParser.new(content)
		expect(parser.transcript).to eq "Hands in the air! don't turn around! Okay. don't turn around!"
	end
	
	
end
