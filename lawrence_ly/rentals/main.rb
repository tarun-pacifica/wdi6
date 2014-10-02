# require 'pry'
system('clear')

require_relative'./tenant.rb'
require_relative'./apartment.rb'
require_relative'./building.rb'

lawrence = Tenant.new('Lawrence Ly', '24', 'm')
puts lawrence

apt = Apartment.new('25b',100,1,3)
puts apt

building = Building.new('123 Fake St', 'Neo-Industrial',true,false,1000,1)
puts building

	angela = Tenant.new('Angela', '19', 'f')
	puts angela

	apt1 = Apartment.new('25a',100,1,15)
	puts apt1

	building1 = Building.new('100 Real St', 'hipster',true,true,100,500)
	puts building1

# if you are going to have multiple buildings use globals $ and $ tenants
#Globals to store date
# Seed Data 
$buildings = []
$apartment = []
$tenant = []


$buildings.push building
$buildings.first.apartments[apt.name]= apt
$buildings.first.apartments[apt.name].tenants.push lawrence

$buildings.push building1
$buildings[1].apartments[apt.name]= apt1
$buildings[1].apartments[apt.name].tenants.push angela


def menu
	puts "1. List all apartments "
	puts "2. List all buildings "
	puts "3. list all tenants "
	puts "4. list where tenants live"
	puts "q. Quit"
end

def read_selection
	menu
	gets.chomp.downcase
end

menu_option = read_selection.to_s
until menu_option == 'q'
	case menu_option
		when '1'
			# List all apartments
			$buildings.each do |b|
				b.apartments.each do |number, apartment|
					puts apartment
				end
			end
		when '2'
		# List all buildings
			$buildings.each do |b|
				puts b
			end
	 	when '3' # List all tenants on the system
			$buildings.each do |b|
				b.apartments.each do |n, a|
					a.tenants.each do |t|
					puts "#{t} lives at #{a} #{n}" 
					end
				end
			end


	 	when '4' 
	  		$buildings.each do |b|
		 		b.apartments.each do |n, a|
		 			a.tenants.each do |t|
					puts "#{t} lives at #{n}"
					end
				end	
			end
	end

					menu_option = read_selection

end

binding.pry

