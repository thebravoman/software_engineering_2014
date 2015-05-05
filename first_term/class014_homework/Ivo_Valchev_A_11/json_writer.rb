class JSONWriter
	def write data
		write_to_json_hash = Hash.new
		write_to_json_hash["homework_evaluation"] = Hash.new
		student_hash = write_to_json_hash["homework_evaluation"]
		student_hash["student"] = Array.new
		data.each do |name, values|
			cur_hash = Hash.new
			cur_hash["name"] = name
			cur_hash["vhodno_nivo"] = values[0]
			cur_hash["class002"] = values[1]
			cur_hash["class003"] = values[2]
			cur_hash["class004"] = values[3]
			cur_hash["class009"] = values[4]
			cur_hash["class012"] = values[5]
		
			student_hash["student"] << cur_hash
		end

		pretty_json = JSON.pretty_generate(write_to_json_hash)
		File.open("results_Ivo_Valchev_A_11.json", "w") do |result|
			result.puts pretty_json
		end
	end
end
