require 'csv'

class CSVWriter
	def write data, time_taken
		CSV.open('results_Dimitar_Terziev_A_6.csv', 'w') do |csv|
			csv << [time_taken, '', HOMEWORK_NAMES, 
				HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "g#{num}" }, 
				HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "y#{num}" }].flatten
			data.each do |key, value|
				csv << [key.split('_'), value].flatten
			end
		end
	end
end
