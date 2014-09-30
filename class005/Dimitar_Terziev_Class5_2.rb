require "fileutils"
Dir.glob(ARGV[0]+"class004/*.rb") do |file|	
	if("#{file}".split('/').last=~/_2/)
		Dir.glob(ARGV[0]+"class004_homework/*") do |fixture|
			if("#{fixture}".split('/').last!=/expected_results/)
				d = `ruby #{file} #{fixture}`
				open('problem_report.csv', 'w') do |f1|
				  	f1 << d
				end
				puts FileUtils.compare_file('problem_report.csv', "#{ARGV[0]}/class004_homework/expected_results.csv")
			end
		end
	end
end
