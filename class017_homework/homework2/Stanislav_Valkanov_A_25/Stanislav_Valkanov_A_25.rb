require_relative "csv_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "svg_writer.rb"
require_relative "html_writer.rb"
firstname = Array.new
results = Hash.new
file_count=0
measureTime = Time.now

CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |name|
	vh=name[1] 
	vh=vh.split.join
	flname=name[1]
	flname=flname.split
	flname=flname[0]+"_"+flname[1]
	results[flname] = Hash.new
	results[flname]["VH"] = 0
	Dir.glob(ARGV[0]+"/vhodno_nivo/**/") do |content|
		if File.directory?(content)
			Dir.glob(content+"/*.*").each do |name|
				file_count += 1
			end
			if file_count >= 3
				content = content.split('/').last.split('_')
				if content.size>1
					content = content[0]+content[1]
					if vh==content
						commit_time = `git log #{content}`
						if (commit_time==(`git log --until=Sep--17--2014--20:00:00 #{content}`))
							results[flname]["VH"] = 2
						else
							results[flname]["VH"] = 1
						end
					end
				end
			end
			file_count=0
		end
	end
	i=0
	Dir.glob(ARGV[0]+"/vhodno_nivo/*.*") do |content|
		cheker=content.split("/").last.split("_")
		if cheker.size >1
			a=cheker[0]+cheker[1]
			Dir.glob(ARGV[0]+"/vhodno_nivo/*.*") do |content1|
				cheker1=content1.split("/").last.split("_")
				if cheker1.size>1
					b=cheker1[0]+cheker1[1]
					if b==a
						i+=1

					end
					if i>=3
						
						if vh==b
							commit_time = `git log #{content}`
							if (commit_time==(`git log --until=Sep--17--2014--20:00:00 #{content}`))
								results[flname]["VH"] = 2
							else
							results[flname]["VH"] = 1
							end
						end
					end
				end
			end
		i=0
		end
	end

	Dir.chdir(ARGV[0]+"/class002_homework/") do |fixture|
		expected_file =flname+"_Class2_2.rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Sep--22--2014--20:00:00 #{expected_file}`))
				results[flname]["002"] = 2
			else
				results[flname]["002"] = 1
			end
			
		else	
			expected_file =flname+"_Class2_1.rb"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Sep--22--2014--20:00:00 #{expected_file}`))
					results[flname]["002"] = 2
				else
					results[flname]["002"] = 1
				end
			else
			results[flname]["002"] = 0
			end
		end	
	end
	Dir.chdir(ARGV[0]+"/class003_homework/") do |fixture|
		expected_file =flname+"_Class3_2.rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Sep--24--2014--20:00:00 #{expected_file}`))
				results[flname]["003"] = 2
			else
				results[flname]["003"] = 1
			end
			
		else	
			expected_file =flname+"_Class3_1.rb"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Sep--24--2014--20:00:00 #{expected_file}`))
					results[flname]["003"] = 2
				else
					results[flname]["003"] = 1
				end				
			else
			results[flname]["003"] = 0
			end
		end	
	end
	Dir.chdir(ARGV[0]+"/class004_homework/") do |fixture|
		if  File.exist?(flname)
			commit_time = `git log #{flname}`
			if (commit_time==(`git log --until=Sep--29--2014--20:00:00 #{flname}`))
				results[flname]["004"] = 2
			else
				results[flname]["004"] = 1
			end
			
		else	
			results[flname]["004"] = 0
		end	
	end
	
	Dir.chdir(ARGV[0]+"/class009_homework/") do |fixture|
		expected_file =name[0]
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Oct--27--2014--20:00:00 #{expected_file}`))
				results[flname]["009"] = 2
			else
				results[flname]["009"] = 1
			end
			
		else	
			expected_file =expected_file+".pdf"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Oct--27--2014--20:00:00 #{expected_file}`))
					results[flname]["009"] = 2
				else
					results[flname]["009"] = 1
				end				
			else
				results[flname]["009"] = 0
			end
		end	
	end

	Dir.chdir(ARGV[0]+"/class012_homework/") do |fixture|
	Dir.glob(ARGV[0]+"/class012_homework/*") do |fixture1|
	fixture1=fixture1.split("/").last
	if fixture1.split("_").size==4
		expected_file =flname+"_"+fixture1.split("_")[2]+"_"+fixture1.split("_")[3]
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Nov--10--2014--20:00:00 #{expected_file}`))
				results[flname]["012"] = 2
				break
			else
				results[flname]["012"] = 1
				break
			end
			
		else	
			results[flname]["012"] = 0
	end	end	
	end	end

	Dir.chdir(ARGV[0]+"/class014_homework/") do |fixture|
	Dir.glob(ARGV[0]+"/class014_homework/*") do |fixture1|
	fixture1=fixture1.split("/").last
	if fixture1.split("_").size==4
		expected_file =flname+"_"+fixture1.split("_")[2]+"_"+fixture1.split("_")[3]
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Nov--13--2014--06:00:00 #{expected_file}`))
				results[flname]["014"] = 2
				break
			else
				results[flname]["014"] = 1
				break
			end
			
		else	
			results[flname]["014"] = 0
	end	end	
	end	end

	Dir.chdir(ARGV[0]+"/class015_homework/") do |fixture|
	Dir.glob(ARGV[0]+"/class015_homework/*") do |fixture1|
	fixture1=fixture1.split("/").last
	if fixture1.split("_").size==4
		expected_file =flname+"_"+fixture1.split("_")[2]+"_"+fixture1.split("_")[3]
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Nov--20--2014--06:00:00 #{expected_file}`))
				results[flname]["015"] = 2
				break
			else
				results[flname]["015"] = 1
				break
			end
			
		else	
			results[flname]["015"] = 0
	end	end	
	end	end
def floging, task
	flog = `flog #{task}`
		if flog != ""
			flog = flog.split(':').first
			if flog
				grades["#{name}"][additional_index] = flog
			end
		end
end
p Time.now - measureTime
end
if ARGV[1] == "-o"
	case ARGV[2]
	when "csv"
		writer = CSVWriter.new
	when "xml"
		writer = XMLWriter.new
	when "json"
		writer = JSONWriter.new
	when "html"
		writer = HTMLWriter.new
	when "svg"
		writer = SVGWriter.new
	else
		abort("Change -o")
	end
	writer.write(results)
end

 
