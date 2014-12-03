
class XMLWriter
	def write(results)
		xml = File.open("results_Stefan_Iliev_B_28.xml", "w")
		xml.puts("<results>")
		results.each do |key, hw_hash|	
			xml.puts("	<student>")
			xml.puts("		<FirstName> #{key.split("_").first} </FirstName>")
			xml.puts("		<LastName> #{key.split("_")[1]} </LastName>")
			xml.puts("		<entry_homework>  #{hw_hash.values_at("entry_homework").first}  </entry_homework>")
			xml.puts("		<homework_1> #{hw_hash.values_at("homework_1").first} </homework_1>")
			xml.puts("		<homework_2> #{hw_hash.values_at("homework_2").first} </homework_2>")
			xml.puts("		<homework_3> #{hw_hash.values_at("homework_3").first} </homework_3>")
			xml.puts("		<homework_4> #{hw_hash.values_at("homework_4").first} </homework_4>")
			xml.puts("		<homework_5> #{hw_hash.values_at("homework_5").first} </homework_5>")
			xml.puts("		<homework_6> #{hw_hash.values_at("homework_6").first} </homework_6>")
			xml.puts("		<homework_7> #{hw_hash.values_at("homework_7").first} </homework_7>")

			xml.puts("		<flog_1> #{hw_hash.values_at("flog_1").first} </flog_1>")
			xml.puts("		<flog_2> #{hw_hash.values_at("flog_2").first} </flog_2>")
			xml.puts("		<flog_3> #{hw_hash.values_at("flog_3").first} </flog_3>")
			xml.puts("		<flog_5> #{hw_hash.values_at("flog_5").first} </flog_5>")
			xml.puts("		<flog_6> #{hw_hash.values_at("flog_6").first} </flog_6>")
			xml.puts("		<flog_7> #{hw_hash.values_at("flog_7").first} </flog_7>")

			xml.puts("		<flay_1> #{hw_hash.values_at("flay_1").first} </flay_1>")
			xml.puts("		<flay_2> #{hw_hash.values_at("flay_2").first} </flay_2>")
			xml.puts("		<flay_3> #{hw_hash.values_at("flay_3").first} </flay_3>")
			xml.puts("		<flay_5> #{hw_hash.values_at("flay_5").first} </flay_5>")
			xml.puts("		<flay_6> #{hw_hash.values_at("flay_6").first} </flay_6>")
			xml.puts("		<flay_7> #{hw_hash.values_at("flay_7").first} </flay_7>")


			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
