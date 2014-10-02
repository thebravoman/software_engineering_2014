scriptsDir = ARGV[0]
fixturesDir = ARGV[1]

resultsCsv = File.new('results.csv', 'w+')
Dir.glob(fixturesDir + "*").each do |fixture|
	if 	File.file?(fixture + '/expected_results.csv')
		name = fixture.split("/").last
		resultsCsv.print(',' + name.split("_")[0] + ' ' + name.split("_")[1])
	end
end
resultsCsv.puts() #new line after the row containing the fixture names is filled

Dir.glob(scriptsDir + "*_1.rb").each do |script|
	name = script.split("/").last
	resultsCsv.print(name.split("_")[0] + ' ' + name.split("_")[1])
	
	Dir.glob(fixturesDir + "*").each do |fixture|
		scriptOutput = `ruby #{script} #{fixture}`
		taskSolved = '0'
		csvContent = ''
		
		if 	File.file?(fixture + '/expected_results.csv')
			csvFile = File.open(fixture + '/expected_results.csv', 'r')
			csvContent = csvFile.read
			csvFile.close
		end
		
		#whitespace has to be removed so the comparison can be made
		scriptOutput = scriptOutput.gsub(/\s+/, "")
		csvContent = csvContent.gsub(/\s+/, "")
		if scriptOutput.eql? csvContent 
			puts "#{script.split('/').last} successful with #{fixture.split('/').last}"
			taskSolved = '1'
		end
		
		if csvContent != ''
			resultsCsv.print(',' + taskSolved)
		end
	end
	
	resultsCsv.puts() #new line after a row with script against fixtures
end

resultsCsv.close #close file, inache na popravka

$end
