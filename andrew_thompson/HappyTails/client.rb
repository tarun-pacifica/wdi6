# Here I'm creating a class for animals at the shelter. Within the class is the Method,
# Animals. This contains a series of Instance Variables e.g. (@name = name)

class Client
  def initialize(first_name, last_name, number_children, client_age, client_gender, number_pets)
    @first_name = first_name
    @last_name = last_name
    @number_children = number_children
    @client_age = client_age
    @client_gender = client_gender
    @number_pets = number_pets
  end


  def to_s
	"#{ @first_name } #{ @last_name } is a #{ @client_age } year old #{ @client_gender } with #{ @number_children } and #{ @number_pets }."
  end
end

