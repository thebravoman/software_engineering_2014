require 'csv'
file_hash=Hash.new
Dir.glob("#{ARGV[0]}/*.csv").each do |raw_file|
filename=raw_file.split("/").last
file=File.open("#{raw_file}")
file_read=file.readlines
if file_read.length<4
file_hash[filename]=file_read.length.to_i
end
end

file_hash=file_hash.sort_by{|key,val| val}
#puts file_hash

File.open("results.xml","w") do |xml|
file_hash.each do |key,value|
	xml.puts("<results>
				<#{key}>
					<#{key}>
						#{value}
					</#{key}>
				</#{key}>
				<#{key}>
					<#{key}>
						#{value}
					</#{key}>
				</#{key}>
				<#{key}>
					<#{key}>
						#{value}
					</#{key}>
				</#{key}>
			</results}")
end
end
