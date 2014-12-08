class ExpectedSearcher
	def find(repoPath)
		expected = Hash.new
		Dir.glob("#{repoPath}/class019_test/files_for_exam_2/expects/*.*") do |path|
			hashcode = path.split("/").last.split(".").first
			expected[hashcode] = `cat #{path}`
		end
		return expected
	end
end
