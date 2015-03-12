require 'nokogiri'
require 'active_support/inflector'


Dir.glob(ARGV[0]+"/*.html") do |file_title|
	#puts file_title
  title_with_ex = file_title.split('/').last #
  title = title_with_ex.split('.').first.downcase
  #puts title_with_ex
  #puts title
  word_capi = title.capitalize
  word_plur = title.pluralize
  word_up = title.upcase
  word_capi_plur = title.capitalize.pluralize
  word_plur_up = title.pluralize.upcase

  # puts word_capi, word_plur, word_up, word_capi_plur, word_plur_up
  Dir.glob(ARGV[0]+"/*.html").each do |file|
    current_file_name = file.split('/').last.split('.').first.downcase
    f = File.open(file)
      content = Nokogiri::HTML(f).at('body').content
    f.close

    next if title == current_file_name

    content.gsub!(title, "<a href=\"#{title_with_ex}\">#{title}</a>") if content.include? title # nothing
    content.gsub!(word_capi, "<a href=\"#{title_with_ex}\">#{word_capi}</a>") if content.include? word_capi # capitalize
    content.gsub!(word_plur, "<a href=\"#{title_with_ex}\">#{title}</a>") if content.include? word_plur # pluralize
    content.gsub!(word_up, "<a href=\"#{title_with_ex}\">#{word_up}</a>") if content.include? word_up # upcase
    content.gsub!(word_capi_plur, "<a href=\"#{title_with_ex}\">#{word_capi}</a>") if content.include? word_capi_plur # capitalize & pluralize
    content.gsub!(word_plur_up, "<a href=\"#{title_with_ex}\">#{word_up}</a>") if content.include? word_plur_up # pluralize & upcase

    File.open(file, "w") do |f|
     f.puts("<!DOCTYPE html>")
      f.puts("<head>")
       f.puts("<title>#{current_file_name}</title>")
      f.puts("</head>")
      f.puts("<body>")
       f.puts("#{content}")
      f.puts("</body>")
		 f.puts("</html>")
		end
  end
end
