system('clear')

require 'pry'

stations = {
	"n" => ["times square", "34th", "28th_n", "23rd", "union square", "8th_n"],
	"l" => ["8th_l", "6th", "union square", "3rd", "1st"],
	"six" => ["grand central", "33rd", "28th_6", "23rd", "union square", "astor place"]
}

def ask(question)
	puts question
	gets.chomp.downcase
end

def menu
	@line_answer = ask("What line are you on? please N / L / Six ?")
	@first_line_station = ask("What station are you on? Your options are : #{ @origin_line } ")
	@second_line_answer = ask("which line is your destination on? N / L / Six ?")
	@second_line_station = ask("Which destination on line #{ @second_line_station }, your options are #{ @destination_line }")
end

menu

@origin_line = stations[@line_answer]
@origin_station = stations[@line_answer].index(@first_line_station)
@destination_line = stations[@second_line_answer]
@destination_station = stations[@second_line_answer].index(@second_line_station)
start_intersect_index = 0

	if @origin_line == @destination_line
		answer = (@origin_station - @destination_station).abs
		puts answer

	else
		intersect = "union square"
		start_intersect_index = stations[@line_answer].index(intersect)
		end_intersect_index = stations[@second_line_answer].index(intersect)


		start_line_stop = (start_intersect_index - @origin_station).abs
		end_line_stop = (end_intersect_index - @destination_station).abs

		total_stops = start_line_stop + end_line_stop
		puts "Total stops between is #{ total_stops }."
	end

	menu




# def read_selection
# 	menu
# 	gets.chomp.downcase
# end

# menu_option = read_selection

# until menu_option == 'q'
# 	case menu

		# if line_answer == 'n' && second_line == 'n'
		# puts a_n_line.index(station_answer).abs + a_n_line.index(destination_answer).abs
		# end

		# if line_answer == 'l' && second_line == 'l'
		# puts a_l_line.index(station_answer).abs + a_l_line.index(destination_answer).abs
		# end

		# if line_answer == '6' && second_line == '6'
		# puts a_6_line.index(station_answer).abs + a_6_line.index(destination_answer).abs
		# else 
# end2
