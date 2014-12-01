require 'open3'

def get_extention hex
	Dir.glob(expects_path+hex+".*") do |file|
		file = file.split(/\//).last.split(/\./).last
	end
end

def get_fixture hash
	hex = script_file.split("/").last.split('_')[3].split('.')[0]	
	has.each do |k,v|
		v.each do |h|
			if h == hex
				return k
			end
		end
	end
end
		
def find_expected_and_task script_file, fixture_to_result
	expects_path = ARGV[0]+"expects/"
	tasks_path = ARGV[0]+"tasks/"
	begin
		hex = script_file.split("/").last.split('_')[3].split('.')[0]
		number = script_file.split("/").last.split('_')[2]

		if hex != nil
			ext = get_extention hex
			fixture_to_result[:expected] = File.read(expects_path+hex+".#{ext}")
			fixture_to_result[:task] = File.read(tasks_path+number+"_"+hex+".txt")
		end	
		true
end

hash_to_fix = Hash.new
hash_to_fix["../"+ARGV[0]+"/class016/Stefan_Iliev_B_28/fixture/"] = ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]
hash_to_fix["../"+ARGV[0]+"/class016/Vanya_Santeva_5_B/fixture/"] = ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
hash_to_fix["../"+ARGV[0]+"/class016/Radoslav_Kostadinov_22_A/fixture/"] = ["b128c3", "6f8073", "fd50e0", "755d84", "8a6e81", "bd4324", "02e338"]
hash_to_fix["../"+ARGV[0]+"/class016/Moreti_Angelov_19_A/fixture/"]  = ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]
results = Hash.new
count =0
results_path =ARGV[0]+"results/*.rb"
Dir.glob(results_path).each do |script_file|

	arg = get_fixture hash_to_fix
	results[script_file] = Hash.new
	
	fixture_to_result = results[script_file]	
	if find_expected_and_task script_file, fixture_to_result	

		stdin, stdout, stderr = Open3.popen3("ruby #{script_file} #{arg}")
		begin 
			fixture_to_result[:output] = File.read("result.csv")
			`rm -f result.csv`
		end 
	
		if (fixture_to_result[:output] <=> fixture_to_result[:expected]) == 0
			fixture_to_result[:result] = 1
		else
			fixture_to_result[:result] = 0
		end
	end 
end

File.open("result_Ivo_Stratev_B_16.html","w") do |file|
		file.puts "<html>"
		file.puts "<head></head>"
		file.puts "<body>"
		file.puts "<table border=\"1\">"
		result.each do |key, value|
			key_split = key.split(" ")
			file.puts "\t\t<td>#{key.split(/\//).last.split(/_/)[0]}<td>"
			file.puts "\t\t<td>#{key.split(/\//).last.split(/_/)[1]}<td>"
			file.print "\t\t<td>"
			file.print value
			file.puts "</td>"
			file.puts "\t</tr>"
		end
		file.puts "</table>"
		file.puts "</body>"
		file.puts "</html>"
		file.close
end
