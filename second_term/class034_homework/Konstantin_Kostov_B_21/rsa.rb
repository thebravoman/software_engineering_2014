
_letters="abcdefghijklmnopqrstuvwxyz1234567890-=_+ABCDEFGHIJKLMNOPQRSTUVWZYZ!@\#$%^&*(),./<>?;':\"\\[]{}"

$letterToNumberMap={}
$numberToLetterMap={}

counter=0
_letters.each_char do |letter|
    $letterToNumberMap[letter]=counter
    $numberToLetterMap[counter]=letter
    counter=counter+1
end

def badArgs
    puts "Bad Arguments!"
    puts " ruby rsa.rb -e BAD  12 65!"
    puts "ruby rsa.rb -d 5654  1225 1019 3337"
    exit
end

def numStringToNumbers text
    numbers=[]
    nums=text.split ","
    nums.each {|num| numbers << num.to_i}
    numbers
end
def textToNumbers text
    numbers=[]
    letters=text.split ""
    letters.each do |letter|
        numbers << $letterToNumberMap[letter]
    end
    numbers
end

def numbersToText numbers
    text=""
    numbers.each do |number|
        text << $numberToLetterMap[number]
    end
    text
end

def exponentModulus(number, power, modulus)
    res=1
    while power>0 do
        res=(res*number)%modulus if (power % 2)>0
        number=(number*number)%modulus
        power/=2
    end
        res
end
    
badArgs if ARGV[0]==nil

operation=ARGV[0].chomp.downcase

badArgs if operation!="-e" and operation!="-d"
badArgs if ARGV.length!=4

decrypting=false
decrypting=true if operation=="-d"

input=ARGV[1].chomp
k=ARGV[2].chomp.to_i
p=ARGV[3].chomp.to_i

numbers=[]

if decrypting
    numbers=numStringToNumbers(input)
    else
    numbers=textToNumbers(input)
end

encrypted=[]
numbers.each do |number|
    encrypted <<  exponentModulus(number, k, p)
end

encryptedText=""

if decrypting
    encryptedText=numbersToText encrypted
    else
    encryptedText=encrypted.join(", ")
end

puts encryptedText



numberName="e"
numberName="d" if decrypting

if !decrypting
    puts "Converting text into numbers:"
    puts "\"#{input}\" => #{numbers.inspect}"
end

c=0
numbers.each do |number|
   
    c=c+1
end
if decrypting
    puts "Converting encrypted numbers into text:"
    puts "\"#{encrypted.inspect}\" => #{encryptedText}"
    else
    puts "Getting the encrypted numbers: #{encryptedText}"
end
