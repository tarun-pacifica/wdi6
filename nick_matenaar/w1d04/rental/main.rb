######
## System info

require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'

# Globals to store our data
$buildings = [] # Array that stores all buildings
$apartments = {} # Array that stores all apartments
$tenants = [] # Array that stores all tenants 

######
## Seed data 


# Tenants 
tenant = Tenant.new('Chris Eccleson', 23, 'male')
tenant_2 = Tenant.new('John Mayer', 45, 'male')
tenant_3 = Tenant.new('Bob Marley', 60, 'male')
tenant_4 = Tenant.new('Jenny Block', 38, 'female')
tenant_5 = Tenant.new('Elizabeth Rose', 30, 'female')

# Apartments
apt = Apartment.new('25b',100, 1, 15)
apt_2 = Apartment.new('60a',60, 2, 3)
apt_3 = Apartment.new('3f',85, 4, 2)
apt_4 = Apartment.new('11e',325, 1, 1)

# Buildings
building = Building.new('21 York Street','Skyscraper', true, true, 85)
building_2 = Building.new('30 Oxford St','Vintage', false, false, 15)

# Load Seed Data into global variables
$buildings.push building
$buildings.push building_2 
$apartments[apt.name] = apt
$apartments[apt_2.name] = apt_2
$apartments[apt_3.name] = apt_3
$apartments[apt_4.name] = apt_4
$tenants.push tenant
$tenants.push tenant_2
$tenants.push tenant_3
$tenants.push tenant_4
$tenants.push tenant_5

# Load apartments into buildings 
$buildings[0].apartments[apt.name] = apt
$buildings[0].apartments[apt_2.name] = apt_2
$buildings[1].apartments[apt_3.name] = apt_3
$buildings[1].apartments[apt_4.name] = apt_4

# load tenants into apartments 
$apartments['25b'].tenants << $tenants[0] << $tenants[1]
$apartments['60a'].tenants << $tenants[2] << $tenants[3]
$apartments['3f'].tenants << $tenants[4]

######
## Menu System 




def display_title
	system('clear')
	puts "RENTAL SYSTEM"
	puts "-------------"
end

def get_choice
	puts " "
	print "Please enter your selection: "
	gets.chomp.downcase
end 

def list_buildings 
	puts "There are #{$buildings.length} buildings."
		puts " "
		$buildings.each do |x|
			puts "#{$buildings.index(x)}. #{x.address}"
		end
		puts " "
end 

def list_apartments(building = nil)
	if building == "a"
		puts " "
		$apartments.each { |key, value| puts key }	

	elsif building.nil? || $buildings[building].nil? 
		puts "Couldn't find that building, listing all #{$apartments.length} apartments..."
		puts " "
		$apartments.each { |key, value| puts key }	
	else
		puts "There are #{$buildings[building].apartments.length} apartments in #{$buildings[building].address}."
		puts " "
		$buildings[building].apartments.each { |key, value| puts key }
	end 

	puts " "
end 

def list_tenants(apartment = nil)
	if apartment == "a"
		puts "Listing all #{$tenants.length} tenants"
		puts " "
		$tenants.each { |t| puts "#{$tenants.index(t)}. #{t.name}" }
		puts " "
	elsif apartment.nil? || $apartments[apartment].nil?
		puts "Couldn't find that apartment, listing all #{$tenants.length} tenants"
		puts " "
		$tenants.each { |t| puts "#{$tenants.index(t)}. #{t.name}" }
		puts " "
	else
		puts "There are #{$apartments[apartment].tenants.length} tenants in #{apartment}."
		puts " "
		$apartments[apartment].tenants.each { |t| puts "#{$apartments[apartment].tenants.index(t)}. #{t.name}" }
		puts " "

	end 
end 

def tenant_lookup(tenant,apartment=nil)

	if apartment.nil? || $apartments[apartment].nil?
		tenant_data = $tenants[tenant]
	else
		tenant_data = $apartments[apartment].tenants[tenant]
	end 

	return "Couldn't find that tenant" if tenant_data.nil?

	puts "Tenant Information"
	puts " "
	puts "Name: #{tenant_data.name}"
	puts "Age: #{tenant_data.age}"
	puts "Gender: #{tenant_data.gender}"
	puts " "

end

def evict_tenant(tenant_location)
	# Remove from any apartments
	tenant_object = $tenants[tenant_location]

	$apartments.each do |key, value|
		value.tenants.delete tenant_object if value.tenants.include? tenant_object
	end

end	

def move_tenant(tenant_location, apartment)
	evict_tenant(tenant_location)
	$apartments[apartment].tenants << $tenants[tenant_location]
end 

def remove_tenant(tenant_location)
	evict_tenant(tenant_location)
	$tenants.delete_at(tenant_location)
end

def demolish_apartment(apartment)
	$buildings.each do |b| 
		b.apartments.delete apartment if b.apartments.include? apartment 
	end 
	$apartments.delete apartment
end 

def demolish_building(building)
	$buildings.delete_at building 
end 

def menu 
	display_title
	puts "Main Menu"
	puts " "
	puts "1. View entries "
	puts "2. Tenant Menu "
	puts "3. Apartment Menu "
	puts "4. Building Menu "
	puts " "
	puts "Q. Quit "

	user_choice = get_choice

	case user_choice 
	when "q"
		return false
	when "1" # View entries 
		# Display a list of buildings -> apartments -> tenants with up and down 

		# List buildings
		display_title
		list_buildings
		puts "Q. Quit"

		user_choice = get_choice
		return false if user_choice == "q"

		# List apartments
		display_title
		list_apartments(user_choice.to_i)
		puts "A. All"
		puts "Q. Quit"

		user_choice_apartment = get_choice
		return false if user_choice_apartment == "q"

		# List tenants
		display_title
		list_tenants(user_choice_apartment)
		puts "Q. Quit"

		user_choice_tenant = get_choice
		return false if user_choice_tenant == "q"

		# Show tenant info
		display_title
		tenant_lookup(user_choice_tenant.to_i, user_choice_apartment)
		puts " "
		print "Press any key to return to the main menu..."
		gets
		return true 
	when "2" # Tenant Menu 
		display_title
		puts "Tenant Menu"
		puts " "
		puts "1. New tenant"
		puts "2. Existing tenant"
		puts " "
		puts "Q. Quit"

		user_choice = get_choice

		case user_choice
		when "q"
			return false
		when "1" # New Tenant
			display_title
			puts "New Tenant"
			puts " "
			print "Please enter your full name: "
			user_full_name = gets.chomp 

			display_title
			puts "New Tenant"
			puts " "
			print "Please enter your age: "
			user_age = gets.chomp.to_i

			display_title
			puts "New Tenant"
			puts " "
			print "Please enter your gender: "
			user_gender = gets.chomp 

			$tenants << Tenant.new(user_full_name, user_age.to_i, user_gender)
			display_title
			tenant_lookup $tenants.length - 1
			puts "Tenant entry created!"
			puts " "
			print "Press any key to return to the main menu..."
			gets
			return true 

		when "2" # Existing tenant
			display_title
			puts "Existing tenant"
			puts " "
			puts "Please type your full name to access options"
			puts " "
			print "Full name: "
			user_full_name = gets.chomp 

			user_tenant = $tenants.index { |x| x.name == user_full_name }
			puts user_tenant

			unless user_tenant.nil?
				display_title
				puts "Welcome #{user_full_name}"
				puts " "
				puts "1. Show information"
				puts "2. Edit information"
				puts "3. Delete record"
				puts " "
				puts "Q. Quit"
				puts " "
				user_choice = get_choice

				case user_choice
				when "q" then return false
				when "1" # Show Info
					display_title
					puts "Your Information"
					tenant_lookup user_tenant
					print "Press any key to continue..."
					gets
					return true
				
				when "2" # Edit Info 
					display_title
					puts "Edit Tenant"
					puts " "
					print "Please enter your full name: "
					user_full_name = gets.chomp 

					display_title
					puts "Edit Tenant"
					puts " "
					print "Please enter your age: "
					user_age = gets.chomp.to_i

					display_title
					puts "Edit Tenant"
					puts " "
					print "Please enter your gender: "
					user_gender = gets.chomp 

					$tenants[user_tenant].name = user_full_name
					$tenants[user_tenant].age = user_age
					$tenants[user_tenant].gender = user_gender

					display_title
					tenant_lookup user_tenant
					puts "Tenant entry edited!"
					puts " "
					print "Press any key to return to the main menu..."
					gets
					return true
				when "3" # Delete info
					display_title
					tenant_lookup(user_tenant)
					puts "Are you sure you wish to delete the above? This will also evict #{user_full_name} from their apartment. "
					puts " "
					print "Are you sure? (y/n): "
					user_confirm = gets.chomp.downcase
					if user_confirm == "y"
						display_title
						remove_tenant(user_tenant)
						puts "Tenant Deleted!"
						puts " "
						puts "Press any key to continue... "
						gets
						return true 
					end 
				end
			else
				display_title
				puts "Oops"
				puts " "
				puts "Sorry we do not have you in this system"
				puts " "
				print "Press any key to continue..."
				gets
				return true 
			end
		else
			return true
		end
	when "3" # Apartment Menu
		display_title
		puts "Apartment Menu"
		list_apartments("a")
		puts " "
		print "Please select the apartment you wish to edit: "
		user_choice_apartment = gets.chomp 

		if $apartments.has_key? user_choice_apartment

			display_title
			puts "Apartment Menu"
			puts " "
			puts "1. Move-in tenant"
			puts "2. Evict tenant"
			puts "3. Change Price"
			puts "4. Show information"
			puts " "
			puts "Q. quit"

			user_choice = get_choice

			case user_choice
			when "q" 
				return false
			when "1" # Move-in tenant
				display_title
				puts "Apartment Menu"
				list_tenants("a")
				puts " "

				user_choice = get_choice 
				move_tenant(user_choice.to_i, user_choice_apartment)

				display_title
				puts "Apartment Menu - Move tenant"
				puts " "
				puts "Success! Moved #{$tenants[user_choice.to_i].name} in to #{user_choice_apartment}"
				puts " "
				print "Press any key to continue..."
				gets
				return true
			when "2" # Evict Tennant
				display_title
				puts "Apartment Menu - Evict tenant"
				puts " "
				list_tenants(user_choice_apartment)
				puts " "

				user_choice = get_choice.to_i
				selected_tenant = $apartments[user_choice_apartment].tenants[user_choice]

				unless selected_tenant.nil?
					display_title
					puts "Apartment Menu - Evict tenant"
					puts " "
					puts "Are you sure you wish to evict #{selected_tenant.name}"
					puts " "
					print "Are you sure? (y/n): "

					user_confirm = gets.chomp.downcase
					return true unless user_confirm == "y"

					tenant_location = $tenants.index { |x| x == selected_tenant}
					print tenant_location
					evict_tenant(tenant_location)

					display_title
					puts "Apartment Menu - Evict Tenant"
					puts " "
					puts "Success! Evicted #{selected_tenant.name} from #{user_choice_apartment}"
					puts " "
					print "Press any key to return..."
					gets 
					return true 


				else
					puts "Oops"
					puts " "
					puts "That tenant doesn't exsist"
					print "Press any key to return..."
					gets 
					return true 
				end
			when "3" # Change price 
				display_title
				puts "Apartment Menu"
				puts " "
				puts "Current price: $#{$apartments[user_choice_apartment].price}"
				puts " "
				print "Enter new price: $"
				user_new_price = gets.chomp.to_i 

				$apartments[user_choice_apartment].price = user_new_price

				display_title
				puts "Apartment Menu"
				puts " "
				puts "Success! Price of #{$apartments[user_choice_apartment].name} changed to #{user_new_price}"
				puts " "
				print "Press any key to continue..."
				gets
				return true 
			when "4" # Show information 
				display_title
				puts "Apartment Menu "
				puts " "
				puts $apartments[user_choice_apartment]
				puts " "
				print "Press any key to continue..."
				gets
				return true 


			end
		else
			display_title
			puts "Oops"
			puts " "
			puts "Sorry that apartment doesn't exist!"
			puts " "
			print "Press any key to continue..."
			gets
			return true 
		end
	when "4" # Building Menu
		display_title 
		puts "Building Menu"
		puts " "
		puts "1. New Building"
		puts "2. Edit Building"
		puts "3. Add Apartment"
		puts "4. Demolish Apartment"
		puts "5. Demolish Building"
		puts " "
		puts "Q. Quit "
		puts " "

		user_choice = get_choice

		case user_choice 
		when "q"
			return false
		when "1" # New building 
			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Please enter the address of your new building"
			puts " "
			print "Address: "
			b_address = gets.chomp 

			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Please enter the style of your new building"
			puts " "
			print "Style: "
			b_style = gets.chomp 

			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Does your building have a doorman? "
			puts " "
			print "(Y/N): "
			user_choice_doorman = gets.chomp.downcase
			if user_choice_doorman == "y"
				b_doorman = true 
			else 
				b_doorman = false 
			end 

			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Does your building have an elevator?"
			puts " "
			print "(Y/N): "
			user_choice_elevator = gets.chomp.downcase
			if user_choice_elevator == "y"
				b_elevator = true 
			else 
				b_elevator = false 
			end 

			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Please enter the number of floors your new building has"
			puts " "
			print "Floors: "
			b_floors = gets.chomp.to_i

			$buildings << Building.new(b_address, b_style, b_doorman, b_elevator, b_floors)

			display_title
			puts "Building Menu - New Building"
			puts " "
			puts "Success! Your building has been created"
			$buildings.last 
			puts " "
			print "Press any key to continue..."
			gets
			return true
		when "2" # Edit building
			display_title
			puts "Building Menu - Edit building"
			list_buildings
			puts " "
			puts "Q. Quit"
			puts " "
			user_choice_building = get_choice

			return false if user_choice_building == "q"

			unless $buildings[user_choice_building.to_i].nil?
				display_title
				puts "Building Menu - Edit Building"
				puts " "
				puts "Please enter the new address of your building"
				puts " "
				print "Address: "
				b_address = gets.chomp 

				display_title
				puts "Building Menu - Edit Building"
				puts " "
				puts "Please enter the new style of your building"
				puts " "
				print "Style: "
				b_style = gets.chomp 

				display_title
				puts "Building Menu - Edit Building"
				puts " "
				puts "Does your building have a doorman? "
				puts " "
				print "(Y/N): "
				user_choice_doorman = gets.chomp.downcase
				if user_choice_doorman == "y"
					b_doorman = true 
				else 
					b_doorman = false 
				end 

				display_title
				puts "Building Menu - Edit Building"
				puts " "
				puts "Does your building have an elevator?"
				puts " "
				print "(Y/N): "
				user_choice_elevator = gets.chomp.downcase
				if user_choice_elevator == "y"
					b_elevator = true 
				else 
					b_elevator = false 
				end 

				display_title
				puts "Building Menu - Edit Building"
				puts " "
				puts "Please enter the new number of floors your building has"
				puts " "
				print "Floors: "
				b_floors = gets.chomp.to_i

				$buildings[user_choice_building.to_i].address = b_address
				$buildings[user_choice_building.to_i].style = b_style
				$buildings[user_choice_building.to_i].has_doorman = b_doorman
				$buildings[user_choice_building.to_i].has_elevator = b_elevator
				$buildings[user_choice_building.to_i].num_floors = b_floors

				display_title
				puts "Building Menu"
				puts " "
				puts "Success!, Your building at #{$buildings[user_choice_building.to_i].address } has been created! "
				puts " "
				puts $buildings[user_choice_building.to_i]
				puts " "
				print "Press any key to continue...."
				return true 

			else
				puts "Building Menu - Edit Building"
				puts " "
				puts "Oops that building doesn't exist"
				puts " "
				print "Press any key to continue..."
				gets 
				return true
			end

		when "3" # Add Apartment 
			display_title
			puts "Building Menu - Add Apartment"
			puts " "
			puts "What is the name of your Apartment?"
			puts " "
			print "Name: "
			a_name = gets.chomp 

			display_title
			puts "Building Menu - Add Apartment"
			puts " "
			puts "What is the total area in square feet of your Apartment?"
			puts " "
			print "Area: "
			a_sqft = gets.chomp.to_i 

			display_title
			puts "Building Menu - Add Apartment"
			puts " "
			puts "What are the total number of bathrooms in your Apartment?"
			puts " "
			print "Bathrooms: "
			a_bathrooms = gets.chomp.to_i

			display_title
			puts "Building Menu - Add Apartment"
			puts " "
			puts "What are the total number of bedrooms in your Apartment?"
			puts " "
			print "Bedrooms: "
			a_bedrooms = gets.chomp.to_i 

			display_title
			puts "Building Menu - Add Apartment"
			list_buildings
			puts " "
			puts "Which building is this apartment in? "
			print "Building: "
			a_building = gets.chomp.to_i

			unless $apartments.has_key? a_name 
				$apartments[a_name] = Apartment.new(a_name, a_sqft, a_bathrooms, a_bedrooms)
				$buildings[a_building].apartments[a_name] = $apartments[a_name]
				display_title
				puts "Building Menu - Add Apartment"
				puts " "
				puts "Success! #{a_name} added to #{$buildings[a_building].address}"
				puts " "
				print "Press any key to continue..."
				gets
				return true

			else
				display_title
				puts "OOPS"
				puts " "
				puts "That apartment doesn't seem to exist"
				puts " "
				print "Press any key to continue..."
				gets
				return true
			end 


		when "4" # Demolish Apartment 
			display_title
			puts "Demolish Apartment" 
			list_apartments("a")
			puts " "
			puts "Q. Quit"
			puts " "
			user_choice_apartment = get_choice

			return false if user_choice_apartment == "q"

			if $apartments.has_key? user_choice_apartment
				display_title
				puts "Demolish Apartment"
				puts " "
				puts "Are you sure you want to demolish #{user_choice_apartment}?"
				puts " "
				print "Are you sure? (Y/N): "
				user_choice = gets.chomp.downcase 

				return true unless user_choice == "y"

				demolish_apartment user_choice_apartment

				display_title
				puts "Demolish Apartment" 
				puts " "
				puts "Success! #{user_choice_apartment} has been demolished! "
				puts " "
				print "Press any key to continue "
				gets
				return true

			else 
				puts "OOPS!"
				puts " "
				puts "That apartment doesn't seem to exist "
				puts " "
				print "Press any key to continue "
				gets 
				return true 
			end 

		when "5" # Demolish Building 
			display_title
			puts "Demolish Building"
			list_buildings
			puts " "
			puts "Q. Quit"
			puts " "

			user_choice_building = get_choice

			return false if user_choice_building == "q"

			if $buildings[user_choice_building.to_i].nil? 
				display_title
				puts "OOPS"
				puts " "
				puts "Doesn't look like that building exists.."
				puts " "
				print "Press any key to continue..."
				gets 
				return true 
			else
				display_title
				puts "Demolish Building"
				puts " "
				puts "Are you sure you want to demolish #{$buildings[user_choice_building.to_i].address}?" 
				puts " "
				print "Are you sure? (Y/N): "
				user_choice = gets.chomp.downcase

				return true unless user_choice == "y" 

				demolish_building(user_choice_building.to_i)

				display_title
				puts "Demolish Building"
				puts " "
				puts "Success! Building was demolished!"
				puts " "
				print "Press any key to continue..."
				gets
				return true
			end 
		end 
	end
return true
end 
running = true # running parameter 
while running 
	running = menu
end 

system('clear')
