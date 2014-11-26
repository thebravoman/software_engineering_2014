require_relative 'task.rb'
class Task3 < Task
def init_contexts
context1_1 = {
:task_number=>"3",
:what_to_find=>"the length of the students first name",
:which_to_sort => "First Name",
:in_what_order => "ASC",
:expected=>
"
["Firstname2","Lastname","5","10"]
["Firstname4","Lastname","6","10"]
["Firstname6","Lastname","21","10"]
"
}
context1_2 = {
:task_number=>"3",
:what_to_find=>"the length of the students first name",

:which_to_sort => "First name",
:in_what_order => "DESC",
:expected=>
"
["Firstname6","Lastname","5","10"]
["Firstname4","Lastname","21","10"]
["Firstname2","Lastname","6","10"]


"
}
context1_3 = {
:task_number=>"3",
:what_to_find=>"the length of the students first name",

:which_to_sort => "Number",
:in_what_order => "DESC",
:expected=>
"
["Firstname6","Lastname","21","10"]
["Firstname4","Lastname","6","10"]
["Firstname2","Lastname","5","10"]

"
}
context1_4 = {
:task_number=>"3",
:what_to_find=>"the length of the students first name",
:which_to_sort => "Number",
:in_what_order => "ASC",
:expected=>
"
["Firstname6","Lastname","5","10"]
["Firstname4","Lastname","6","10"]
["Firstname2","Lastname","21","10"]

"
}
[context1_1,context1_2,context1_3,context1_4]
end
def initialize
super 'task3.eruby'
end
end
