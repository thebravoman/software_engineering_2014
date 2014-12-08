def get_name file
	name = file.split(/\//).last.split(/_/)
	if name[0] != nil && name[1] != nil
			name = name[0].capitalize + ' ' + name[1].capitalize
	end
	if name != nil
		return name
	end
end
