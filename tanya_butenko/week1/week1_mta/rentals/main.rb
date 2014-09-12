system('clear')

require 'pry'

require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'

chris = Tenant.new('Chris Eccleston', 23, 'male')


apt = Apartment.new('25b', 100, 1, 15)
apt1 = Apartment.new('11a', 80, 1, 2)


building = Building.new('123 Fake St', 'Neo-industrial', true, false, 1000)


#globals to store data
$buildings = []
$tenants = []
$apartments = []


#seed data
$buildings.push building
$buildings.first.apartments[apt.name] = apt
$buildings.first.apartments[apt.name].tenants << chris
$buildings.first.apartments[apt1.name] = apt1
$tenants << chris


def main_menu
	puts "Welcome to the realestate agency"
	puts 
	puts "Choose the category"
	puts "1. Tenant"
	puts "2. Agent"
end

def tenant_menu
	puts "Hello tenant"
	puts
	puts "Choose from the following options:"
	puts "1. New Tenant"
	puts "2. Current Tenant"
end

def new_tenant_menu
	puts "Welcome new tenant"
	puts
	puts "Choose what would you like to do:"
	puts "1. Register"
	puts "2. Check all unoccupied apartments"
	puts "3. Look for apartments with particular features"
	puts "4. Move in to a new apartment"
end

def current_tenant_menu
	puts "Welcome back"
	puts 
	puts "Choose what would you like to do:"
	puts "1. Check all unoccupied apartments"
	puts "2. Look for apartments with particular features"
	puts "3. Move out from current apartment"
	puts "4. Move to another apartment"
end

#rename
def show_menu
	puts "q. Quit"
	input = gets.chomp
	exit if input == 'q'
	input
end

main_menu
main_menu_option = show_menu

case main_menu_option
when '1'
	tenant_menu
    tenant_menu_option = show_menu

	case tenant_menu_option
	when '1'
		new_tenant_menu
		new_tenant_option = show_menu

		case new_tenant_option
		when '1'
			puts "Please, enter your valid name, age and gender separated with comma."
			i = gets.chomp
			info = i.split ', '
			new_tenant = Tenant.new(info[0], info[1], info[2])
			$tenants << new_tenant
			puts "You are successfully registered in our system"
		when '2'
			
			puts "Here is a list of unoccupied apartments:"
			$buildings.each do |b|
				b.apartments.each do |number, apartment|
					puts apartment unless apartment.occupied? 
				end
			end
			
		when '3'
		when '4'
			puts "What is the name of the apartment you are moving in?"
			a_name = gets.chomp
			$buildings.first.apartments[a_name].tenants << new_tenant
		end

	when '2'
		current_tenant_menu
		current_tenant_option = show_menu

		case current_tenant_option
		when '1'
		when '2'
		when '3'
		when '4'
		end

	end

when '2'
	puts "Not ready"
else
	puts "Hello, we are a serious agency! Choose the existing option number or go and play in another place!"
end



binding.pry


# def menu
# 	puts "1. List all apts"
# 	puts "q. Quit"
# end

# def read_selection
# 	menu
# 	gets.chomp.downcase
# end

# menu_option = read_selection

# until menu_option == 'q'
# 	case menu_option
# 	when '1'
# 		#building all apt
# 		$buildings.each do |b|
# 			b.apartments.each do |apartment|
# 				puts apartment
# 			end
# 		end

# 		menu_option = read_selection
# 	end
# end