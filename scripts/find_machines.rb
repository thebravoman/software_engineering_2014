
#finds the machines that are up and running in the cabinet
#range is of the form 172.6.18.1-255
#only machines with two digits as last segment of the ip are returned
def find_machines range
	result = `nmap -sP #{range}`
	result.scan(/\b(?:\d{1,3}\.){3}\d{2}\b/).to_a
end

machines = find_machines ARGV[0]
puts machines
#~ `ssh student@#{machines[0]}`

