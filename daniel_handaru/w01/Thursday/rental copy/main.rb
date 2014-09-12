system('clear')

require 'pry'

require_relative './tennant.rb'
require_relative './apartment.rb'
require_relative './building.rb'


$buildings = []

$tennant = []

$apartment = [] 

kim = Tennant.new('Kim Salmon', '19', 'f', 	'23/123 Fake St')
stuart = Tennant.new('Stuart Goodman', '45', 'm', '12/84 Ulundri Dr')
chris = Tennant.new('Chris Eccleston', 23, 'm', '4/22 Jimmy Rd')
lucy = Tennant.new('Lucy Johannson', 21, 'f', '13/22 Jimmy Rd')
james = Tennant.new('James Johnson', 34, 'm', '46/123 Fake St')

apt = Apartment.new('Museum Tower',100, 1, 3, 3)
apt_2 = Apartment.new('City Dream', 50, 2, 4, 4)
apt_3 = Apartment.new('Luxury Homestead', 75, 3, 2, 2)


building = Building.new("Museum Tower", '123 Fake St', 'Neo-industrial', 'yes', 'yes', 30, '5')
building_a = Building.new("City Dream", "22 Jimmy Rd", 'Stop-gap', 'yes', 'yes', 10, '9')
building_b = Building.new("Luxury Homestead", "84 Ulundri Dr", 'Space-Age', 'no', 'no', 5, 3 )

# $buildings << building_a
# $buildings << building





#seed data

$buildings.push(building)
# $buildings.first.apartments[apt.name] = apt
# $buildings.first.apartments[apt.name].tennants << chris
$buildings.push(building_a)
# $buildings.first.apartments[apt.name] = apt
# $buildings.first.apartments[apt.name].tennants << chris
$buildings.push(building_b)

$tennant.push(chris)
$tennant.push(lucy)
$tennant.push(james)
$tennant.push(kim)
$tennant.push(stuart)

$apartment.push(apt)
$apartment.push(apt_2)
$apartment.push(apt_3)





def menu
	puts "Welome to Daniel's Real Estate"
	puts "1. List all available apartments"
	puts "2. List all tennants"
	puts "3. Find extra details of a listed apartment"
	puts "4. Find a specific apartment"
	puts "5. Find a specific tennant"
	puts "q for Quit"
	
end


def read_selection
	menu
	gets.chomp.downcase
end








menu_option = read_selection

until menu_option == 'q'
	case menu_option
		when '1' #list all apt
			$buildings.each do |b|
				# b.apartments.each do |apartment|
					puts b
			end

		when '2' 
			$tennant.each do |p|
					puts p
			end
		
		when '3'
			$apartment.each do |a|
				puts a
			end

		when '4'
			puts "Enter the street name of the building:"
				a = gets.chomp
			
			search_results =[]
			search_results = $buildings.select {|b| b.address == a}

			search_results.each do |s|
				puts s
			end

		when '5'
			puts "Enter a tennant name (first and last):"
				n = gets.chomp

			search_results = []
			search_results = $tennant.select {|b| b.name == n}
			
			
			search_results.each do |s|
				puts s
			end

	end
				menu_option = read_selection
		
end
# end












binding.pry