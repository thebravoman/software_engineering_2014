require 'rubygems'
require 'nokogiri'
require 'csv'

# run as
# ruby check_yt_tests.rb results/a/yt_specs/ yt/coverage/index.html 

def get_model_and_student file
	model = file.split("/").last.split("_")[0..-2].join("_")
	student = file.split("/")[-2]
	[model,student]
end

class Coverage
	
	attr_reader :file

	def initialize file
		@file = file
	end
	
	def get_coverages
		model = get_model_and_student(file)[0]
		coverages = Hash.new(0)
		if File.exists?(ARGV[1])
			page = load_coverage
			coverages[model]= get_model_coverage(page, model)
		end
		coverages
	end

	private
	
	def load_coverage
	  Nokogiri::HTML(open(ARGV[1]))
	end
	
	def get_model_coverage page, model
		set = page.css('td')
		set.each do |td|
			link = td.css('a')
			if link[0] && link[0].text == "lib/yt/models/#{model}.rb"
				index = set.index td
				return set[index+1].text.split(" ").first.to_f
			end
		end
	end
end

class RunSpecs
	attr_reader :file
	
	def initialize file
		@file = file
		tuple =  get_model_and_student(file)
		@model = tuple[0]
		@student = tuple[1]
	end
	
	def run_for_coverage
		#~ `cd yt && rspec spec/models/#{@model}_spec.rb`
		`cd yt && rspec spec/models/`
		cov = Coverage.new file
		coverage = cov.get_coverages
		p @student, @model, coverage[@model]
		#~ `rm yt/coverage -rf`
		puts
		{student: @student, coverage: [@model, coverage[@model]]}
	end
end

class RunSpecsWithRepoReset < RunSpecs
	
	def run_for_coverage
		reset_repo
		add_spec_helper
		super
	end

	def reset_repo
		`cd yt && git clean -f && git reset --hard`
	end
	
	def add_spec_helper
		content = File.read(file)
		content = "require 'spec_helper'\n" + content
		p "yt/spec/models/#{file.split("/").last}"
		File.open("yt/spec/models/#{file.split("/").last}","w") do |to_write|
			to_write.write(content)
		end
	end

end
`rm yt/coverage -rf`
specs = Dir.glob(ARGV[0]+"/*_*_*/*_spec.rb")
results = {}
specs.each do |spec|
	p "Running spec simple: #{spec}"
	runner = RunSpecs.new spec
	res = runner.run_for_coverage
	results[res[:student]] = {old_coverage: res[:coverage]}
	p results
end

specs.each do |spec|
	p "Running spec with repo reset: #{spec}"
	runner = RunSpecsWithRepoReset.new spec
	res = runner.run_for_coverage
	results[res[:student]][:new_coverage] = res[:coverage]
	p results
end

CSV.open("results.csv","w") do |csv|
	csv << ["Student","Passed","Diff Coverage","Existing spec","Coverage","New spec","Coverage"]
	results.each_key do |key|
		old_cov = results[key][:old_coverage][1]
		new_cov = results[key][:new_coverage][1]
		diff = new_cov-old_cov
		csv << [key,diff>15,diff,results[key][:old_coverage],results[key][:new_coverage]].flatten
	end
end

