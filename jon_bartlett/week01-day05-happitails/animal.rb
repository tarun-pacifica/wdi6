class Animal

  attr_accessor :name, :age, :gender, :species, :toys

  def initialize (name, age, gender, species)
  	@name = name
  	@age = age
  	@gender = gender
  	@species = species
  	@toys = []
  end

  def to_s
    puts "#{name} is a #{gender} #{species} aged #{age} and has #{toys.length} toys"
  end

end

