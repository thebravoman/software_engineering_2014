require_relative 'task.rb'
class Task1 < Task
def init_contexts
context1_1 = {
:task_number=>"1",
:name=>"Alexander",
:letters=>"7",
:in_what_order=>"ASC",
:file_format=>"json",
:file_format_example=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
",
:expected=>
"F5le8,L5le1
F5le2,L5le2
F5le3,L5le3
"
}
context1_2 = {
:task_number=>"1",
:name=>"Iosif",
:letters=>"5",
:in_what_order=>"ASC",
:file_format=>"html",
:file_format_example=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
",
:expected=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
"
}
context1_3 = {
:task_number=>"1",
:name=>"Andrea",
:letters=>"7",
:in_what_order=>"DESC",
:file_format=>"html",
:file_format_example=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
",
:expected=>
"F5le8,L5le1
F5le3,L5le3
F5le2,L5le2
"
}
context1_4 = {
:task_number=>"1",
:name=>"Vasil",
:letters=>"5",
:in_what_order=>"DESC",
:file_format=>"json",
:file_format_example=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
",
:expected=>
"FirstName2,LastName2
FirstName1,LastName1
F10letters,L10letters
F10letter3,L10letter4
F10letter2,L10letter2
F10letter0,L10letter1
"
}
[context1_1,context1_2,context1_3,context1_4]
end
def initialize
super 'task1.eruby'
end
end
