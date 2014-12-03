class CSVWriter
	def say 
		p "hi"
	end
	def write data, time_taken
		CSV.open('results_Stanimir_Bogdanov_A_24.csv', 'w') do |csv|
			csv << [time_taken, '', HOMEWORK_NAMES, 
				HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "g#{num}" }, 
				HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "y#{num}" }].flatten
			data.each do |key, value|
				csv << [key.split('_'), value].flatten
			end
		end
	end
end
