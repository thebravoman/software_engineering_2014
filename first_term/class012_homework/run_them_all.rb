Dir.glob("*.rb").each do |file|
	if !file.include?("run_them_all.rb") && !file.include?("Stefan_Iliev")
		p "Running #{file}"
		`ruby #{file} /home/kireto/tues/tp/software_engineering_2014/`
		p "End running #{file}"
		`cd .. && git checkout master`
		p "End checkout"
	end
end
