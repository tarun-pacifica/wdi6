require 'pry'
system('clear')
class Person

  def initialize(age,person,gender)
    @gender = gender
    @age = age
    @person = person
    puts "initialize"
  end

  def speak
    puts "gday"
  end

  def get_age
    @age
  end

  def set_age(age)
    @age = age
  end

  def talk(words_to_say)
    puts "well, #{words_to_say}"
  end

end

binding.pry