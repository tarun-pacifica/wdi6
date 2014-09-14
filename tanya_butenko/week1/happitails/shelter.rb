class Shelter
	attr_accessor :client, :animal

	def initialize(animal, client)
		@animal = {}
		@client = {}
	end

	def to_s
		"This shelter has #{ @animal.length } animals and #{ @client.length } clients."
	end
end