class Tennant
	attr_accessor :name, :age, :gender, :apt_no

	def initialize(name, age, gender, apt_no)
		@name = name
		@age = age
		@gender = gender
		@apt_no = apt_no
	end

	def to_s #to string
		"#{@name} is a #{@age} year old #{@gender} & lives at #{@apt_no}."
	end

end