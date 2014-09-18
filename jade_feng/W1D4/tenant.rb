# Class for Tenants!

class Tenant
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)	
		@name = name
		@age = age
		@gender = gender
	end

	def to_s		# To make the tenant output look better as a string
		 "The tenant #{ @name.upcase }, #{ @gender }, is #{ @age }-years-old"
	end

end
