hashmap = {}
pathToHomeworks = "/Users/dimitarnestorov/Documents/software_engineering_2014/vhodno_nivo/"
Dir.glob(pathToHomeworks + "**/*.*") do |myFile|
    myFile = myFile.split("/").last.split(".").first.split("_")
    if myFile.size == 3
        myFile[2] = myFile[2].gsub(/[^\d]/, '')
        person = myFile[0]+" "+myFile[1]
        if hashmap[person].nil?
            hashmap[person] = myFile[2].to_s
        else
            hashmap[person] = hashmap[person] + "," + myFile[2].to_s
        end
    end
end
hashmap.each{|x,y|
    z=0
    y = y.split(",").uniq
    y.each{|v| z+=v.to_i}
    y = y.join(",")
    puts x+","+y+","+z.to_s
}