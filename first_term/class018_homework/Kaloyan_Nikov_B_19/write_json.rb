require 'json'

def write_to_JSON(results,time,name)
	classes = "VH", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1"
	i = 0
	file = File.open("#{name}.json","w")
	hash = Hash.new
	res_hash = Hash.new
	results.each do |name, val|
		hash["FirstName"] = name.split(' ')[0]
		hash["LastName"] = name.split(' ')[1]
		res_hash["Seconds"] = time
		classes.each do |hw|
			res_hash[hw] = val[i]
			i += 1
		end
		hash["results"] = res_hash
		file.write(hash.sort.to_json)
	end
end