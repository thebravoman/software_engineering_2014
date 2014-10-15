require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:what_to_find=>"all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order",
			:what_to_calculate=>"the length of their names (including extensions).",
			:which_to_sort => "lenth",
			:in_which_order => "DESC",
			:expected=>
"FirstName3Invalid_LastName3Invalid.rb,37
FirstName3_LastName3Invalid.rb,31
F10letter1_L10letter1.rb,24
F10letter2_L10letter2.rb,24
F10letter3_L10letter4.rb,24
F10letters_L10letters.rb,24
invalid.rb,10
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:what_to_find=>"all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order",
			:what_to_calculate=>"the length of their names (including extensions).",
			:which_to_sort => "length",
			:in_which_order => "ASC",
			:expected=>
"invalid.rb,10
F10letter1_L10letter1.rb,24
F10letter2_L10letter2.rb,24
F10letter3_L10letter4.rb,24
F10letters_L10letters.rb,24
FirstName3_LastName3Invalid.rb,31
FirstName3Invalid_LastName3Invalid.rb,37
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:what_to_find=>"all the files from both folders that have only letters from a-z or A-Z in their names excluding extension. If there are duplicates the file must be written only once.",
			:what_to_calculate=>"the length of their names (including extensions) divided by 2.",
			:which_to_sort => "length",
			:in_which_order => "DESC",
			:expected=>
"invalid.rb,5
"
		}
		
		context1_4 = {
			:task_number=>"1",
			:what_to_find=>"all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.",
			:what_to_calculate=>"the length of their names (including extensions) divided by 2 rounded to the smalles number",
			:which_to_sort => "File name",
			:in_which_order => "DESC",
			:expected=>
"F10letter3_L10letter4_3,12
F10letter2_L10letter2_6,11
F10letter1_L10letter1_7,11
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task3.eruby'
	end

end
