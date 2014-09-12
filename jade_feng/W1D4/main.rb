# Things to work on:
	# In './apartment.rb', need to add the address from the 'building' during the return statement. Relevant for adding the apartments and listing the apartments
	# In './tenant.rb', need to add the apartment number and address during the return statement. Relevant for listing details about tenants
	# Need to incorporate price add when required for the apartment details
	# Need to check the bug for the 
	# Need to announce that the new tenant is living in which apartment
	# Need to list the names of the apartments in the buildings
	# Need to list the names of the tenants in the apartments

#######################################################
system('clear')

require_relative './tenant.rb'					#Go into the file directory and link to the Tenant.rb file
require_relative './apartment.rb'
require_relative './building.rb'

#######################################################
# START ASKING QUESTIONS


# Global arrays to store our data
$buildings = [] 		
apartment = []
tenants = []

def locate_building(address)
	$buildings.each do |b|
		if b.address.downcase == address.downcase
			return b
		end 
	end
	return nil 	# this loop still wants to return stuff. So that even if the above doesn't exist, it will still return the b. Hence by adding the nil, it removes that mistake 
end

def locate_apartment(build, n)
	build.apartments.each do |name, apart|
		if apart.name.downcase == n.downcase
			return apart
		end 
	end
	return nil 	# this loop still wants to return stuff. So that even if the above doesn't exist, it will still return the b. Hence by adding the nil, it removes that mistake 
end

#######################################################
# Preliminary Test Data

# Tenant 
chris = Tenant.new('Chris Eccleston', 23, 'male')

# Apartment
apt = Apartment.new("25b", 100, 1, 3)

# Building
bld = Building.new('123 Fake St', 'neo-industrial', true, false, 1000)

#######################################################

#Seed data -- only for the testing stage.
$buildings.push bld 
$buildings.first.apartments[apt.name] = apt
$buildings.first.apartments[apt.name].tenants << chris


#######################################################

def menu
	puts "--------------------------------"
	puts "Welcome to the Real Estate Database."
	puts "         _._._._._._._._._._._._._._._._._      "
	puts "         | ___   ___    ___    ___   ___ |      "
	puts "         ||_|_| |_|_|  |_|_|  |_|_| |_|_||      "
	puts "         |IIIII_IIIII__IIIII__IIIII_IIIII|      "     
	puts "         | ___   ___    ___    ___   ___ |     "
	puts "         ||_|_| |_|_|  |_|_|  |_|_| |_|_||     "
	puts "         |IIIII_IIIII__IIIII__IIIII_IIIII|     "
	puts "         | ___   ___    ___    ___   ___ |     "
	puts "         ||_|_| |_|_|  |_|_|  |_|_| |_|_||     "
	puts "         |IIIII_IIIII__IIIII__IIIII_IIIII|    /)"
	puts "         | ___   ___   _____   ___   ___ | __/ ),"
	puts "   ~ ^~^ ||_|_| |_|_|  o~|~o  |_|_| |_|_||  ~^~^"
	puts "  . ' .'.|IIIII_IIIII__|_|_|__IIIII_IIIII|'^~^'.',"
	puts " .,' , . |             =====             |.'.'.'. "
	puts " "
	puts "What would you like to do?"
	puts "1. List all avaliable buildings."
	puts "2. List all avaliable apartments."
	puts "3. List all tenants on the system."
	puts "4. Add a new building."
	puts "5. Add a new apartment."	 			
	puts "6. Add a new tenant to the system." 	
	puts "q. Quit"
end 

def read_selection
	menu
	gets.chomp.downcase
end

menu_option = read_selection

#######################################################


#######################################################

until menu_option == 'q'
	case menu_option
	
	when '1' 	#List all avaliable buildings
		$buildings.each do |b|
			puts b
			puts b.to_s2
		end		
		menu_option = read_selection

	when '2'	# List all apartments 
		$buildings.each do |b|
			b.apartments.each do |n, a|
				puts a 
			end
		end
		menu_option = read_selection
	
	when '3' 	# List all tenants on the system
		$buildings.each do |b|
			b.apartments.each do |n, a|
				a.tenants.each do |t|
					puts t
				end
			end
		end
		menu_option = read_selection
		
	when '4' 	# Add a new building
		puts "What is the address?"
		@address_n = gets.chomp
		puts "What is the style?"
		@style_n = gets.chomp
		puts "Is there a doorman? (Y/N)"
		@doorman = gets.chomp.downcase
			@doorman_n = @doorman == "y"		
		puts "Is there an elevator? (Y/N)"
		@elevator = gets.chomp.downcase
			@elevator_n = @elevator == "y" 
		puts "How many floors are there?"
		@floors_n = gets.chomp

		building = Building.new(@address_n, @style_n, @doorman_n, @elevator_n, @floors_n)
		
		$buildings.push building 		# Push new addition onto the building array

		puts "This is the new buildings list: "
		$buildings.each do |b|			# The new list of buildings
			puts b
			puts b.to_s2
		end		

		menu_option = read_selection



	when '5' 	# Add a new apartment
		puts "What is the number of the apartment?"
		@name_n = gets.chomp
		puts "How many square feet is the apartment?"
		@sqft_n = gets.chomp
		puts "How many bathrooms are there?"
		@bathrooms_n = gets.chomp		
		puts "How many bedrooms are there?"
		@bedrooms_n = gets.chomp

		apartment = Apartment.new(@name_n, @sqft_n, @bathrooms_n, @bedrooms_n)

		# Locate this building!		
		puts "What is the address of the building?"
		@address_name = gets.chomp.downcase

		@building_x = locate_building(@address_name)

		unless @building_x  == nil 	# Building located!
			@building_x.apartments[apartment.name] = apartment

		else 
			puts "Sorry! Your address doesn't exist! Why don't you try and put in your new building before adding this apartment?"
			menu_option = read_selection
		end

		puts "This is the new apartments list: "
		$buildings.each do |b|
			b.apartments.each do |n, a|
				puts a 
			end
		end		
		menu_option = read_selection

	when '6' 	# Add a new tenant to the system (later add them to a building)

		puts "What is the name of the new tenant?"
		@ten_name_n = gets.chomp
		puts "What is their age?"
		@age_n = gets.chomp
		puts "What is their gender?"
		@gender_n = gets.chomp		

		tenant = Tenant.new(@ten_name_n, @age_n, @gender_n)

		# Locate this building!		
		puts "What is the address of their building?"
		@address_name = gets.chomp.downcase

		@building_x = locate_building(@address_name)

		if @building_x  == nil 
			puts "Sorry! Your address doesn't exist! Why don't you try and put in your new building before adding this apartment?"
			menu_option = read_selection
		else 
			puts "What is the number of the apartment?"
			@apartment_num = gets.chomp.downcase

			@apartment_x = locate_apartment(@building_x, @apartment_num)

			if @apartment_x == nil
				puts "Sorry! Your apartment doesn't exist! Let's go back and create it!"
				menu_option = read_selection
			else 
				@apartment_x.tenants.push tenant 		# FINALLY ADDING THE TENANT TO HIS APARTMENT!
			end
		end

		puts "This is the new list of tenants: "
		$buildings.each do |b|
			b.apartments.each do |n, a|
				a.tenants.each do |t|
					puts t
				end
			end
		end		
		menu_option = read_selection
	
	else 
		puts "Sorry. That was not an option. Let's try again!"	
		menu_option = read_selection

	end
end

puts "You just quit the system! Have a great day!"




##########################################################################################

require 'pry'
binding.pry

##########################################################################################
# # building.apartments is a hash
# # push the apartment into the building hash
# building.apartments[apt.name] = apt
# building.apartments["25b"].tenants << chris
# building.apartments["25b"].tenants.first.age		# It is 23
# building.apartments["25b"].tenants.first.age += 1 	# Changing Chris' age to 24
# building.apartments["25b"].tenants.first.name = "Christina" 	# Changing Chris' name to Christina

# tim = Tenant.new('Tim', 33, 'male')				# Someone new
# building.apartments["25b"].tenants << tim 		# Put tim into his own apartment
# building.apartments["25b"].occupied?			# Do people live in 25B?
# building.apartments["25b"].tenants.length		# How many tenants?
# building.apartments["25b"].tenants 				# Who are the tenants?
