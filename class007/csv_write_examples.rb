require 'csv'

=begin
array = [
			[,	Fixture1, Fixture2, Fixture3],
			[Student1, 1,				0,					0],
			[Student2, 1,				1,					0]
		]

hash_map = -> THIS ONE WORKS
		{
			key:student1
			value: {F1:1,F2:0,F3:1,F4:0}	
		}


hash_map = 
		{
			key:student1
			value:[F1,F2,F3,F4]
		}
		
hash_map = 
		{
			key:student1
			value:[1,0,1,0]
		}
=end
#~ array = 
	#~ [
		#~ [1,2,3,4], #0
		#~ [1,2,3,4,5,6,7], #1
		#~ [5,6,16,26,36,46,56] #2
	#~ ]

#~ array[2]->[5,6,16,26,36,46,56]
#~ array[2][3] ->26
#~ array[0][17] -> nil
#~ array[0][0] -> 1

CSV.open("file_name.csv", "w") do |csv|
	array.each do |element|
		csv << element
	end
end








