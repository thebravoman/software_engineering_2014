Dir.glob("*/*_*_*_*.rb").each do |file|
	if !file.include?("run_them_all.rb")
		dir = file.split("/")[0]
		file = file.split("/")[1]
		
		p "Running #{dir}/#{file}"
		["csv","xml","json","html","svg"].each do |format|
			p "Current dir"
			p `pwd`
			p "cd #{dir} && ruby #{file} /home/kireto/tues/tp/software_engineering_2014/ -o #{format}"
			`cd #{dir} && ruby #{file} /home/kireto/tues/tp/software_engineering_2014/ -o #{format}`
		end
		p "End running #{file}"
		p "Current dir"
		p `pwd`
		`cd .. && git checkout master`
		p "End checkout"
	end
end
