require 'csv'
require 'yaml'

class CSVWriter
	def self.write(students,config_file_path)
		@@config = YAML.load_file(config_file_path)["headers"]
		hw_h = @@config["homeworks"]
		g_h = @@config["flog"]
		y_h = @@config["flay"]
		res_out_name = @@config["result_output_name"]
		
		hw_count = hw_h.split("|").length
		CSV.open("#{res_out_name}.csv","w") do |csv|
			for i in 1.. hw_count
				csv << [hw_h[i-1]] if hw_h[i-1] != "-"
				csv << [g_h[i-1]] if g_h[i-1] != "-"
				csv << [y_h[i-1]] if y_h[i-1] != "-"
			end 
			students.each do |name , hw_hash| 
				
			end 
		end 
	end
end
