
class FixtureSearcher
	def self.find_with_hash( hash, repository_path )
		path_to_csv = repository_path + "/class017_homework/hash_to_fixture.csv"
		output = `grep #{hash} #{path_to_csv}`.to_s.split(",").first || "FNF"
		return output if output == "FNF"
		return repository_path + output
	end
end