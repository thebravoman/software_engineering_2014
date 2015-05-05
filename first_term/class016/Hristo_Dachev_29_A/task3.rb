require_relative 'task.rb'

class Task3 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"3",
			:grades=>"5",
			:name=>"6",
			:sort=>"ASC",
			:expected=>'"Georgi Ivanov":{
	"1":1,
	"2":1,
	"3":1,
	"4":0,
	"5":0
}'
	}

		context1_2 = {
			:task_number=>"3",
			:grades=>"4",
			:name=>"5",
			:sort=>"DESC",
			:expected=>'"Pesho Gosho":{
	"1":1,
	"2":0,
	"3":0,
	"4":1
}'
		}

		context1_3 = {
			:task_number=>"3",
			:grades=>"7",
			:name=>"6",
			:sort=>"DESC",
			:expected=>'"Lubo Petrov":{
	"1":0,
	"2":1,
	"3":0,
	"4":1,
	"5":1,
	"6":1,
	"7":0
}'
		}

		context1_4 = {
			:task_number=>"3",
			:grades=>"3",
			:name=>"10",
			:sort=>"ASC",
			:expected=>'"Ivan Longlastnm":{
	"1":0,
	"2":0,
	"3":1
}'
		}

		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task3.eruby', 3
	end
end