# Animal:
# An animal should have a name.
# An animal should have an age.
# An animal should have a gender.
# An animal should have a species.
# An animal can have multiple toys.

class Animal
	attr_accessor :name, :age, :gender, :species, :toys, :owner

	def initialize(name, age, gender, species, toys, owner)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
		@owner = owner 		# Either a name or "unadopted"
	end

	def to_s
		"#{name.upcase} is a #{age}-year-old #{gender.downcase} #{species.downcase}. It has #{ toys } toy(s). It is owned by #{owner.upcase}."
	end

end
