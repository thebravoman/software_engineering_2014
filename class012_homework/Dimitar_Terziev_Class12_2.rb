require 'csv'

count =0
error = 0
results = Hash.new
commit_names=""

commit_names1=""

Dir.chdir(ARGV[0].split(ARGV[0].split('/').last).first) {|path| 
	commit_names = `git log --name-only --oneline --before="2014-09-29" "#{ARGV[0]}"`
}
#p commit_names.gsub("\n",'')
Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	script_file_value = script_file.split('/').last.split('.').first
	#puts script_file_value
	if commit_names.include?(script_file_value)
	#puts script_file_value
	results[script_file_value] = Hash.new
		 Dir.glob(ARGV[1]+"*").each do |fixture|
			fixture_file_value = fixture.split('/').last.split('.').first
				expected_file = fixture+"/expected_results.csv"
				if File.exists?(expected_file)
					output = `ruby #{script_file} #{fixture}`
					file_content = File.read(expected_file)
				
					if (output <=> file_content) == 0
						results[script_file_value][fixture_file_value] = 1
					else
						results[script_file_value][fixture_file_value] = 0
					end 
				end
			end
	end
end

CSV.open("results.csv","w") do |csv|
	csv << ["Program name", results.first.last.keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten
	end
end
#puts count
