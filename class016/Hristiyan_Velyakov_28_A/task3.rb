require_relative 'task.rb'
class Task3 < Task
def init_contexts
context1_1 = {
:task_number=>"3",
:more_or_less=>"more",
:in_what_order=>"ASC",
:format=>"csv",
:format_example=>
"file1,30
file2,40
..
fileN,N",
:expected=>
"33lines.rb,33
blabla.rb,97
"
}
context1_2 = {
:task_number=>"3",
:more_or_less=>"less",
:in_what_order=>"DESC",
:format=>"csv",
:format_example=>
"file1,20
file2,10
..
fileN,N",
:expected=>
"jaja.rb,17
pate.rb,9
"
}
context1_3 = {
:task_number=>"3",
:more_or_less=>"less",
:in_what_order=>"ASC",
:format=>"csv",
:format_example=>
"file1,10
file2,20
..
fileN,N",
:expected=>
"pate.rb,9
jaja.rb,17
"
}
[context1_1,context1_2,context1_3]
end
def initialize
super 'task3.eruby'
end
end
