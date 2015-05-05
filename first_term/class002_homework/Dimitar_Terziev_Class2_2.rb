prob_hash = Hash.new
Dir.glob("/home/**/*") do |path_to_file|
	if("#{path_to_file}"=~/software_engineering_2014/)
		Dir.glob("#{path_to_file}/**/*") do |my_curr_file|
			file_str = "#{my_curr_file}"
			if((file_str=~/vhodno_nivo.*\./) && (file_str=~/vhodno_nivo\/.*_|vhodno_nivo\/.*\//) && 
			(file_str.split('/').last.gsub(/\D/,'')!='' && file_str.split('/').last.gsub(/\D/,'').to_i<20))
				if(file_str.split('vhodno_nivo/').last=~/\//)
					name = file_str.split('vhodno_nivo/').last.split('/').first.split(/_\d/).first
				else name = file_str.split('/').last.split(/_\d/).first end
				check=false
				prob_hash.each_key{|key|
					if key == name
					prob_hash[key].push(file_str.split('/').last.gsub(/\D/,'').to_i)
					check=true 
				end}
				if check==false then prob_hash[name] = []
					prob_hash[name].push(file_str.split('/').last.gsub(/\D/,'').to_i)
				end
			end
		end
		break
	end
end
prob_hash.each{|key,value| 
	value.uniq!
	print("#{key.sub('_',' ')},")
	value.each{|element| print("#{element},")}
	print("#{value.inject(:+)}\n")
}
=begin
open('problem_report.csv', 'w') do |f|
	f << "First name,Surname,Solved Problems,Sum\n"
  	prob_hash.each{|key,value| f << "#{key.split('_').first},#{key.split('_').last},#{value.join(' ')},#{value.inject(:+)}\n"}
end
=end
