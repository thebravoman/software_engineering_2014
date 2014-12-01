require 'csv'
results=Hash.new
result=Hash.new
expects=Hash.new
official=Hash.new
folder="files_for_exam_1"

for i in 1..2
	if i==1
		class_name="a"
	else 
		class_name="b"
	end
	Dir.glob(ARGV[0]+"#{folder}/results/#{class_name}/results/*.*").each do |file_name|
		`ruby #{file_name} software_engineering_2014/class008_test/visible/fixture1 software_engineering_2014/class008_test/visible/fixture2`
		test=file_name.split("/").last.split("_").last
		results[test.split(".").first]=CSV.read("result.csv")	
		expects[test.split(".").first]=CSV.read("software_engineering_2014/class017_test/#{folder}/results/#{class_name}/expects/#{test.split(".").first}.csv")

		if expects[test.split(".").first]!=results[test.split(".").first]
			official[file_name.split("/").last.split("_")[0]+" "+file_name.split("/").last.split("_")[1]]=0
		else
			official[file_name.split("/").last.split("_")[0]+" "+file_name.split("/").last.split("_")[1]]=1
		end	
	end
end

folder="files_for_exam_2"
Dir.glob(ARGV[0]+"#{folder}/results/*.*").each do |file_name|
		`ruby #{file_name} software_engineering_2014/class008_test/visible/fixture1 software_engineering_2014/class008_test/visible/fixture2`
		test=file_name.split("/").last.split("_").last
		for x in 1..5
			if x==1 then format=".csv" end
			if x==2 then format=".txt" end
			if x==3 then format=".xml" end
			if x==4 then format=".html" end
			if x==5 then format=".txt" end
			
			if File.exists?("software_engineering_2014/class017_test/#{folder}/expects/#{test.split(".").first}#{format}")
				results[test.split(".").first]=File.read("result#{format}")
				expects[test.split(".").first]=File.new("software_engineering_2014/class017_test/#{folder}/expects/#{test.split(".").first}#{format}", "r")

				if expects[test.split(".").first]!=results[test.split(".").first]
					official[file_name.split("/").last.split("_")[0]+" "+file_name.split("/").last.split("_")[1]]=0
				else
					official[file_name.split("/").last.split("_")[0]+" "+file_name.split("/").last.split("_")[1]]=1
				end
			end
		
	end	
end


File.open("results_Valentin_Georgiev_B_3.html", "w") do |row|
	row << "<table border=10 style=width:50% >"
	official.sort.each do |k, v|
		row << "<tr>"
		row << "<td>"<< k.split(" ")[0] << "</td>"
		row << "<td>"<< k.split(" ")[1] << "</td>"
		row << "<td>"<< v << "</td>"
		row << "</tr>"

			end
	row << "</table>"
		end
