def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

Dir.glob(ARGV[0] + "*.rb") do |program|
  Dir.glob(ARGV[1] + "*") do |fixture|
    program_name = program.split(/\//).last
    fixture_name = fixture.split(/\//).last
    if program.split('/').last.split('.').first.split('_').last == "2"
      if File.exist?("#{fixture}/expected_results2.csv")
        program_output = `ruby #{program} #{fixture}/`
        expected_result = IO.read(File.open("#{fixture}/expected_results2.csv", "r"))
        puts "#{program_name} against #{fixture_name}: " + green('SUCCESS') if program_output == expected_result
        puts "#{program_name} against #{fixture_name}: "  + red("FAILED") if program_output != expected_result
      end
    end
  end
end
