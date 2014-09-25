prob_hash = Hash.new
path_to_file = ARGV[0]
Dir.glob("#{path_to_file}/**/*") do |my_file|
	file_str = "#{my_file}"
	if(((file_str.split(path_to_file.split('/').last+'/').last=~/[a-zA-Z]+_[a-zA-Z]+_[^_].*\d.*\./) && (
	file_str.split(path_to_file.split('/').last+'/').last.gsub(/\D/,'').to_i>1 && 
	file_str.split('/').last.gsub(/\D/,'').to_i<19)) && !(file_str=~/\~/))
		if(file_str.split("#{path_to_file}".split('/').last+'/').last=~/\//) 
		then name = file_str.split("#{path_to_file}".split('/').last+'/').last.split('/').first.sub('_',' ').split(/_/).first
		else name = file_str.split('/').last.sub('_',' ').split(/_/).first end
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
prob_hash.each{|key,value| 
	value.uniq!
	print("#{key},")
	value.each{|element| print("#{element},")}
	print("#{value.inject(:+)}\n")
}
=begin
open('problem_report.csv', 'w') do |f|
	f << "First name,Surname,Solved Problems,Sum\n"
  	prob_hash.each{|key,value| f << "#{key.split('_').first},#{key.split('_').last},#{value.join(' ')},#{value.inject(:+)}\n"}
end
=end
