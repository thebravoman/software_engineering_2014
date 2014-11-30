
class ExpectedSearcher
	@@extension = ""

	def self.read_with_hash( hash, repository_path )
		path_to_tests = repository_path + "/class017_test/"
		path  = `find #{path_to_tests} -name *\\#{hash}\\* | grep expects`.strip.split("\n").first || "ENF_ERROR"
		return "ENF" if path == "ENF_ERROR"
		@@extension = path.split(".").last
		expected = File.read(path)
		return expected
	end 
	
	def self.get_last_extension()
		return @@extension
	end 
	
end