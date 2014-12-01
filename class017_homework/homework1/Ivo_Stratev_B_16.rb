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
hash_to_fix[] = stefan 	= ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]
hash_to_fix[] =
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

CSV.open("official_results.csv", "w") do |csv|
	
	results.each_key do |key|
		ftr = results[key]
		csv << [key,ftr[:result],ftr[:program_error],ftr[:task],ftr[:expected],ftr[:output]]
	end
end
