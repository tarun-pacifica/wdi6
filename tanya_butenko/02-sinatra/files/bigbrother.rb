db = File.new('database.txt', 'a+')

print "Input person and save to a file? (y/n)"
response = gets.chomp.downcase


while response == 'y'
	print "Enter name, age, gender: "
	input = gets.chomp
	db.puts(input)

	print "Input person and save to a file? (y/n)"
	response = gets.chomp.downcase

end

db.close

class Person
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)
		@name = name
		@age = age
		@gender = gender
	end

	#makes whatever in puts to a string
	def to_s
		"#{name} is #{age} years old and #{gender}."
	end

end

db = File.new('database.txt', 'r')
people =[]

db.each do |line|
	#puts line.upcase #can use methods on it
	person_array = line.chomp.split(', ')
	person = Person.new(person_array[0], person_array[1], person_array[2])
	people << person
end

db.close

people.each do |person|
	puts person
end

# require 'pry'
# binding.pry
