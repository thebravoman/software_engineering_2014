require 'nokogiri'
require 'active_support/inflector'


Dir.glob(ARGV[0]+"/*.html") do |file_title|
	#puts file_title
  title_with_ex = file_title.split('/').last #
  title = title_with_ex.split('.').first
  #puts title_with_ex

  #puts title
  Dir.glob(ARGV[0]+"/*.html").each do |file|
    current_file_name = file.split('/').last.split('.').first.downcase
    f = File.open(file)
      content = Nokogiri::HTML(f).at('body').content
    f.close
    next if title != current_file_name
      word_capi = current_file_name.capitalize
      word_plur = current_file_name.pluralize
      word_up = current_file_name.upcase
      word_capi_plur = current_file_name.capitalize.pluralize
      word_plur_up = current_file_name.pluralize.upcase
			# puts word_capi, word_plur, word_up, word_capi_plur, word_plur_up

    content.gsub!(current_file_name, "<a href=\"#{current_file_name}.html\">#{current_file_name}</a>") if content.include? current_file_name # nothing
    content.gsub!(word_capi, "<a href=\"#{current_file_name}.html\">#{word_capi}</a>") if content.include? word_capi # capitalize
    content.gsub!(word_plur, "<a href=\"#{current_file_name}.html\">#{current_file_name}</a>") if content.include? word_plur # pluralize
    content.gsub!(word_up, "<a href=\"#{current_file_name}.html\">#{word_up}</a>") if content.include? word_up # upcase
    content.gsub!(word_capi_plur, "<a href=\"#{current_file_name}.html\">#{word_capi}</a>") if content.include? word_capi_plur # capitalize & pluralize
    content.gsub!(word_plur_up, "<a href=\"#{current_file_name}.html\">#{word_up}</a>") if content.include? word_plur_up # pluralize & upcase

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
