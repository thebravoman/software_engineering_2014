require 'csv'
array=[]
numbers=[]
b=0
h = Hash.new
Dir.glob(ARGV[0]+"*") do |file_name|
	q=file_name.split(/_/)[2]
	w=file_name.split(/_/)[1].to_i
	e=file_name.split(/\./)[1]
	r = file_name.count "_"
	if ("#{q}" > '0') && ("#{w}" != 0)
		if (e == "rb") && (r == 3)
			b-=1
		else
	 		array[b]=file_name
			numbers[b]=file_name.length
		end
	else
		array[b]=file_name
		numbers[b]=file_name.length
	end
	b+=1

end

Dir.glob(ARGV[1]+"*") do |file_name|
	q=file_name.split(/_/)[2]
	w=file_name.split(/_/)[1].to_i
	e=file_name.split(/\./)[1]
	if ("#{q}" > '0') && ("#{w}" != 0)
		if (e == "rb")
			b-=1
		else
	 		array[b]=file_name
			numbers[b]=file_name.length
		end
	else
		array[b]=file_name
		numbers[b]=file_name.length
	end
	for i in 0..b-1
		if array[i]==array[b]
			b-=1
		end
	end
	b+=1

end

for i in 0...b
h[array[i]]= "#{numbers[i]}"
end

CSV.open("example.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
		puts element
	end
	
end
