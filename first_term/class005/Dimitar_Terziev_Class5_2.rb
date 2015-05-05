require "fileutils"
Dir.glob(ARGV[0]+"class004/*.rb") do |file|	
	if("#{file}".split('/').last=~/_2/)
		Dir.glob(ARGV[0]+"class004_homework/*") do |fixture|
			d = `ruby #{file} #{fixture}`
			open('problem_report.csv', 'w') do |f1|
			  	f1 << d
			end
			Dir.glob("#{fixture}/*") do |fix_insides|
				if("#{fix_insides}".split('/').last=~/expect[a-z]*_result[a-z]*.csv/)
					exp_file = "#{fix_insides}"
					if FileUtils.compare_file('problem_report.csv', "#{exp_file}") 
					then oup=" perfect match\n"
					else oup=" difference\n" end
					print "#{file}".split('/').last.sub('_',' ').split('_').first+' '+"#{fixture}".split('/').last.sub('_',' ')+oup
				end
			end
		end
	end
end
