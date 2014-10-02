# Here I'm creating a class for animals at the shelter. Within the class is the Method,
# Animals. This contains a series of Instance Variables e.g. (@name = name)

class Animal
  def initialize(name, age, gender, species, toys)
    @animal_name = name
    @animal_age = age
    @animal_gender = gender
    @animal_species = species
    @animal_toys = toys
  end


  def to_s
	"#{ @animal_name } is a #{ @animal_age } year old #{ @animal_gender } #{ @animal_species }. His favourite toys include #{ @animal_toys }."
  end
end