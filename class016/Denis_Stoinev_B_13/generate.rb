require 'erubis'
require 'securerandom'

`mkdir tasks` if not Dir.exists?("tasks")
`mkdir expects` if not Dir.exists?("expects")

def createTask(tasknum, task, hexcode)
	randNum = SecureRandom.random_number(3) + 5
	context = {
		:task_number => "#{hexcode}",
		:RandNum => "#{randNum}"
	}
	if tasknum == 2 
		if randNum % 2 == 0
			context["Name"] = "LastName"
		else
			context["Name"] = "FirstName"
		end
	end
	createExpects(hexcode, tasknum, randNum)
	input = File.read("task#{tasknum + 1}.eruby")
	eruby = Erubis::Eruby.new(input)
	task.write(eruby.evaluate(context))
end

def createExpects(hexcode, tasknum, randNum)
	expect = File.open("expects/#{hexcode}.txt", "w")
	content = ""
	case tasknum
	when 0
		case randNum
		when 5
			content = "<students><name>Name1</name><name>Name2</name><name>Name5</name></students>"
		when 6
			content = "<students><name>Name3</name><name>Name6</name><name>Name7</name></students>"
		when 7
			content = "<students><name>Name4</name><name>Name8</name></students>"
		end
		expect.write(content)
	when 1
		case randNum
		when 5
			expect.puts("Name1,Denis")
			expect.puts("Name2,Iosyf")
			expect.puts("Name5,Iliev")
		when 6
			expect.puts("Names7,Georgi")
			expect.puts("Names8,Iliyan")
			expect.puts("Names9,Mladen")		
		when 7
			expect.puts("Names11,Mladene")
			expect.puts("Names12,Stefane")
		end
	when 2
		if randNum != 6
		content = "<html><ul><li>First6</li><li>First7</li><li>First8</li><li>First9</li></ul></html>"
		else
		content = "<html><ul><li>Last6</li><li>Last7</li><li>Last8</li><li>Last9</li></ul></html>"
		end
		expect.write(content)
	end
	expect.close
end

ARGV.each do |arg|
	hexcode = SecureRandom.hex(4)
	taskname = arg + "_" + hexcode
	task = File.open("tasks/#{taskname}.txt", "w")
	createTask(SecureRandom.random_number(3), task, hexcode)
	task.close
end
