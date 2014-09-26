class Client
  attr_accessor :name, :num_children, :age, :pets

  def initialize (name, num_children, age)
  	@name = name
  	@num_children = num_children
  	@age = age
  	@pets = []
  end

  def to_s
    puts "#{name.capitalize}, aged #{age}, has #{num_children} children and #{pets.length} pets."
  end

end