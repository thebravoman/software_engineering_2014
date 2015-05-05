require 'open3'

repo = ARGV[0]
Dir.glob("*_*_{B,b,A,a}_*.rb").each do |file|
	if !file.include?("run_them_all.rb")
		p "Running #{file}"
		p "ruby #{file} #{repo}"
		stdin, stdout, stderr = Open3.popen3("ruby #{file} #{repo}")
		File.open("outputs_and_errors/output_#{file}.txt","w") do |file|
			file.write(stdout.readlines.inject(:+))
		end
		File.open("outputs_and_errors/errors_#{file}.txt","w") do |file|
                        file.write(stderr.readlines.inject(:+))
                end
	end
end
