require 'csv'
require 'markaby'

def get_context_of_file path
	array = Array.new
	CSV.foreach(path) do |row|
		array << row
	end
	array
end

def check_if_include hash_code, array
	array.each do |name, hash_codes|		
		return name if hash_codes.split(',').include? hash_code
	end
	false
end

def get_name_hash full_name
	elements = full_name.gsub(/\A.+\/|_[^\/_\.]+\z|.rb/, '').split("_")
	name = elements[0..1].join(" ")
	number, hash_code = elements[2..3]
	return name, hash_code, number
end

def get_tasks_text path
	File.open(path, "r").read
end

def get_fixture_path path, hash_code
	path_task = `find ../../class017_test/files_for_exam_2/tasks/*#{ hash_code }*`.delete("\n")
	text = get_tasks_text path_task
	text = text.downcase
	text = text.scan(/you are given[^\n]+/).first
	arguments = 1
	arguments =  case text
					 when /two/ then 2
					 when /three/ then 3
					 else 1
					 end

	type_input =   case text
						when /csv/ then "csv"
						when /xml/ then "xml"
						when /json/ then "json"
						when /html/ then "html"
						else "folder"
						end
	if(type_input != "folder")
		arguments  -= 1
		fixture_path_run = Array.new
		new_string = `find ../../#{ path }/*#{ type_input }`.split("\n")
		fixture_path_run = [ new_string[0..arguments].join(' ')]
		index = 1;arguments+=1
		while arguments < new_string.size
			fixture_path_run << new_string[index..arguments].join(' ')
			index += 1;arguments+=1
		end
	else	
		fixture_path_run = ["../../#{ path }/"]
	end
	return fixture_path_run
end

def compare get_out, hash_code
	begin
		expected = File.open(`find ../../class017_test/files_for_exam_2/expects/#{ hash_code }*`.delete("\n"), "r").read.gsub(/[\n\s]/, "")
	rescue 
		return 0
	end
	if expected == get_out
		return 1
	else
		return 0
	end
end

def run_the_program hash, fixture, hash_code, name, path
	`ruby #{ path } #{ fixture }` rescue return false
	begin
		puts get_out = File.open(`find result*`.delete("\n"), "r").read.gsub(/[\n\s]/, "")
	rescue
		"Error when trying to read file"
	end
	hash[name] = compare get_out, hash_code
	`rm result*`
	return hash[name]
end

hash = Hash.new

info_file = get_context_of_file("Kalin_Marinov_hashcodes.csv")

Dir.glob("../../class017_test/files_for_exam_2/results/*_*_*_*.rb") do |path| 
	puts "processing #{ path }"
	next unless path =~ /\w+_\w+_\d+.[\d\w]+.rb\z/
	name, hash_code, number = get_name_hash path
	fixture_folder = check_if_include hash_code, info_file 
	next unless fixture_folder
	get_fixture_path(fixture_folder, hash_code).each do |fixture|
		break if run_the_program(hash, fixture, hash_code, name, path) == 1
	end
end


#making html out
hash = hash.sort_by { |key, value| key }

mb = Markaby::Builder.new
mb.html do
	head { title "Results from test" }
	body {
		tag! :table, :border => "1", :style => "text-align:center;", :cellpadding => "5" do
			tr {
				td { "First Name" }
				td { "Last Name" }
				td { "Result" }
			}
			hash.each do |key, value|
				tr {
					td{ key.split(" ").first }
					td{ key.split(" ").last }
					td { value }
				} 	
			end				
		end
	}
end

File.open("result_Kalin_Marinov_A_12.html","w") do |html| 
	html.write(mb.to_s)
end
