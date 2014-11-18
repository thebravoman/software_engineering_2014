
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
			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
