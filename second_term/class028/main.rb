require './subtitles_parser'

content = File.read("/home/kireto/tues/tp/software_engineering_2014/second_term/class028/example.srt")

parser = SubtitlesParser.new content
puts parser.to_html_paragraphs 120000
