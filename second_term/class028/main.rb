require './subtitles_parser'

content = File.read("/home/kireto/tues/tp/software_engineering_2014/second_term/class28/example.srt")

p content
puts "Here goes the parser\n"

parser = SubtitlesParser.new content
puts parser.transcript
