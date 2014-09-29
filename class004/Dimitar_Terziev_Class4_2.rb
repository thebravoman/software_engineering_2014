#require "fileutils"
prob_hash = Hash.new
path_to_file = ARGV[0]
Dir.glob("#{path_to_file}/**/*") do |my_file|
	file_str = "#{my_file}"
	if((file_str.split('/').last=~/\A[^_]+_[^_]+_\d+\./) && ((2..18) === file_str.split('/').last.split('_').last.to_i) && !(file_str=~/\~/))
		name = file_str.split('/').last.sub('_',' ').split(/_/).first
		name.to_s unless name.is_a?String
		check = false
		prob_hash.each_key{|key|
		if key==name
			prob_hash[key].push(file_str.split('/').last.split('_').last.to_i)
			check = true 
		end}
		if check == false then prob_hash[name] = []
			prob_hash[name].push(file_str.split('/').last.split('_').last.to_i)
		end
	end
end
prob_hash.each{|key,value|
	value.sort!.uniq!
}
prob_hash.sort.each{|key,value|
	print "#{key},#{value.join(',')},#{value.inject(:+)}\n"
}
=begin
open('problem_report.csv', 'w+') do |f1|
  	prob_hash.sort.each{|key,value| f1 << "#{key},#{value.join(',')},#{value.inject(:+)}\n"}
end
puts FileUtils.compare_file('problem_report.csv', "#{path_to_file}/expected_results2.csv")
=end
