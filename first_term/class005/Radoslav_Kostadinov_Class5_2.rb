require 'csv'
x1 = ""
x2 = ""
counter1 = 0
counter2 = 0
def remove string
	string.delete "\n"
	end
Dir.glob(ARGV[0]+"*2.rb") do |script|	
	Dir.glob(ARGV[1]+"*") do |fixture|
		name = script.split(/\//).last.split(".").first
		fixtures = fixture.split("/").last
		name1 = name.split("_").first 
		name2 = name.split("_",2).last.split("_").first	

			if File.exist?("#{fixture}/expected_results2.csv")
				file = File.open("#{fixture}/expected_results2.csv","r")
				puts "#{name1} #{name2} against #{fixtures}"
				output = `ruby #{script} #{fixture}`
				x1 = output.gsub("\n", "")
				file_content  = File.read("#{fixture}/expected_results2.csv")
				file_content = remove file_content 
				if (x1 <=> file_content) == 0
				p "true"
				counter1 += 1
				else 
				p "false"
				counter2 +=1
				end
				p counter1
				p counter2
				file.close	
			end
		end
	end
