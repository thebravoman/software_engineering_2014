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
end
