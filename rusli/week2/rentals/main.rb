system('clear')
require 'pry'

require_relative './tenants.rb'
require_relative './apartments.rb'
require_relative './building.rb'

chris = Tenant.new('Chris Ellaston', 23, 'male')
puts chris

apt = Apartment.new('25b', 100, 1, 5)
puts apt

building = Building.new('123 Fake St', 'Neo-industrial', true, false, 1000)
puts building

#globlas to store our data 
$buildings = []
$tenants = []

#seed data

$buildings.push building
$buildings.first.apartments[apt.name] = apt
$buildings.first.apartments[apt.name].tenants << chris


def menu 
	puts "1. List all apartments"
end

def read_selection 
	menu
	gets.chomp.downcase
end

menu_option = read_selection
until menu_option == 'q'
	case menu_option
	when '1'
		#list all apartments
		$buildings.each do |b|
		b.apartments.each do |number, apartment|
			puts apartment
			end
		end

	menu_option = read_selection
	end
end



puts building

# binding.pry