class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = []
		@toys << toys
	end

	# Original to_s method returns Client/Animal ID (Client.0x0x0x0x0x0)
	# When you write a method that is the same name as a method in a super class, then your overriding the behavoir of that paricular method. So in the to_s, wer're over-riding the to_s method.
	# Don't need the puts in the to_s function because i'm putsing it on the main.rb in list_animals function.
	def to_s
		"#{ name } is a #{ gender } #{ species }, is #{ age } years old and has #{ toys.count } toy(s)."
	end 

end