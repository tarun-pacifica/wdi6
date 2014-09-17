system('clear')
require 'SecureRandom'
require 'pry'

class Robot

	attr_reader :instruction_count, :creation_time # Want to read attribute but not set it. So user can't set the name of the robot.



	def initialize
		assign_name # The assign_name .to_.a.sample stuff WAS in here, but now moved to reset so we when a robot is initialized, it is reset. Reset the robot so it gets a new name.
		assign_mac
		@instruction_count = 0
		@creation_time = @boot_time = Time.now
	end

	def reset
		@instruction_count += 1
		@boot_time = Time.now
		assign_name
	end

	def name
		@instruction_count += 1
		@name #Want name returned last in this fucntion, so the instruction count is correct.
	end

	def mac
		@instruction_count += 1
		@mac
	end

	def timers
		"#{ (Time.now - @boot_time).to_i } seconds since last boot, #{ (Time.now - @creation_time).to_i } seconds since creation began."
	end

	private # Hides the way a user can assign_aname
	def assign_name
		letters = ('AA'..'ZZ').to_a.sample
		numbers = Random.rand 100...1000 #Use 3 dots so we dont go over 1000
		@name = letters + numbers.to_s # We can use @name in here because we used ATTR function above.
	end

	def assign_mac
		# 01-23-45-67-89-ab
		@mac = (0...6).map do
			SecureRandom.hex(1)
		end.join(':')
	end 
end

binding.pry
