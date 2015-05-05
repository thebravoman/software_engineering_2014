require 'csv'

students = Array.new
Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last.split('_')
	first_name = s[0]
	last_name = s[1]
	if last_name != nil && last_name.length == 10
		students << ["#{first_name}", "#{last_name}"]
	end
end
st = students.sort_by{|f, l| l}
CSV.open("result.csv", "w") do |csv|
	st.each do |last, first|
		csv << ["#{last}", "#{first}"]
	end
end
