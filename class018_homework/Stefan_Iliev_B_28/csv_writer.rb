require 'csv'
require 'yaml'

class CSVWriter
	def self.generate_header(header) 
		string = ""
		header.split("|").each do |header|
		next if header == "-"
			string += header+","
		end 
		return string
	end 
	
	def self.generate_student( header_, hw_hash, result) 
		counter = 1
		string = ""
		header_.split("|").each do | header |
			if header == "-" 
				counter += 1
				next
			end 
			string += "#{hw_hash.values_at("#{result}#{counter}").first},"
			counter += 1 
		end 
		return string
	end 
	
	def self.write(students,config_file_path)
		@@config = YAML.load_file(config_file_path)["headers"]
		hw_h = @@config["homeworks"]
		g_h = @@config["flog"]
		y_h = @@config["flay"]
		res_out_name = @@config["result_output_name"]
		
		hw_count = hw_h.split("|").length
		CSV.open("#{res_out_name}.csv","w") do |csv|
			
			csv << [ generate_header(hw_h) + generate_header(g_h) + generate_header(y_h).chomp(",")] #flay
		
			students.each do |name , hw_hash| 
				csv << [name.split("_").first + "," +name.split("_").last + "," +
						generate_student(hw_h,hw_hash,"homework_") +
						generate_student(g_h,hw_hash,"flog_") +
						generate_student(y_h,hw_hash,"flay_").chomp(",")]
			end 
		end 
	end
end
