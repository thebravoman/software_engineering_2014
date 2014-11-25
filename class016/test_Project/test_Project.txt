You are given a folder with CSV files.
The folder is passed as first Argument. 
Files contain only strings, seperaited by ','. (Normal CSV)
Parse the files and output the values that length is a 9.
The output file extention is xml.
The xml tree should be in the following schem:

<results>
	<file_name>
		<output>
			"string_with_length_9"
		</output>
	</file_name>
</results>

Program should be named: solve_test_Project_C_n.rb , where C is your class is A/B and its writen in Caps and n is your number.
Output file should be named: FN_C_n.xml , whre FN is your First name that is capitalized.
