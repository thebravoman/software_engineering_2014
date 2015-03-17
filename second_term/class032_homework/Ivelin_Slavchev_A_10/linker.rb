#ruby linker.rb path

def make_link word, ext
	"<a href=" + word + "#{ext}>" + word + "</a>"	
end

def get_file_names dir, ext
	links = []
	dir.each do |file|
		links << File.basename(file, ext)
	end
	links
end
		
ext = ".html"
dir = Dir.glob(ARGV[0] + "/*#{ext}")		

links = get_file_names(dir, ext)
		
dir.each do |file_name|
	text = File.read(file_name)	
	links.each do |link|
  		text = text.sub(link, make_link(link, ext))
  	end
  	File.open(file_name, "w") {|file| file.puts text }
end
