require "./subtitles_parser.rb"

describe "SubtitlesParser" do

	it "moves forward" do
		content = "1
00:00:00,000 --> 00:00:05,000
Hands in the air!
don't turn around!
"
		parser = SubtitlesParser.new(content)
		parser.move 1,1000
		expect(parser.duration).to eq 6000
	end
	
	describe "split on paragraphs" do
	
		it "two paragraphs" do
			content = "1
00:00:00,000 --> 00:00:05,000
Hands in the air!
don't turn around!

2
00:00:08,000 --> 00:00:09,000
Okay.
don't turn around!
"
			parser = SubtitlesParser.new(content)
			expect(parser.to_html_paragraphs 2000).to eq "<p>Hands in the air! don't turn around!</p><p>Okay. don't turn around!</p>"
		end
	
		it "one paragraph" do
			content = "1
00:00:00,000 --> 00:00:05,000
Hands in the air!
don't turn around!

2
00:00:06,000 --> 00:00:09,000
Okay.
don't turn around!
"
			parser = SubtitlesParser.new(content)
			expect(parser.to_html_paragraphs 2000).to eq "<p>Hands in the air! don't turn around! Okay. don't turn around!</p>"
		end	
	end
	
	
	it "gets duration" do
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
		expect(parser.duration).to eq 6155
	end
	
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
