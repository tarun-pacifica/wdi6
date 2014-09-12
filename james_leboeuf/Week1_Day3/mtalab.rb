# require 'pry'
system('clear')
a_n_line = ["Times Square", "34th", "28th_n", "23rd", "Union Square", "8th_n"]
a_l_line = ["8th_l", "6th", "Union Square", "3rd", "1st"]
a_6_line = ["Grand Central", "33rd", "28th_6", "23rd", "Union Square", "Astor Place"]


puts "What line are you on? N/L/6 ?"
line_answer = gets.chomp.downcase

puts "What station are you at?" # List all available options
station_answer = gets.chomp

puts "What line are you heading to?"
second_line = gets.chomp

puts "Which station do you want to get off?"
destination_answer = gets.chomp



if line_answer == 'n' && second_line == 'n'
puts a_n_line.index(station_answer).abs + a_n_line.index(destination_answer).abs
end

if line_answer == 'l' && second_line == 'l'
puts a_l_line.index(station_answer).abs + a_l_line.index(destination_answer).abs
end

if line_answer == '6' && second_line == '6'
puts a_6_line.index(station_answer).abs + a_6_line.index(destination_answer).abs
end



if line_answer == 'n' && second_line == 'l' && destination_answer == ('3rd' || '1st')
puts a_n_line.index(station_answer) + a_n_line.index("Union Square") + a_l_line.index(destination_answer) - a_l_line.index("Union Square").abs
end

if line_answer == 'n' && second_line == 'l' && destination_answer == ('8th_l' || '6th')
puts a_n_line.index(station_answer) + a_n_line.index("Union Square") + a_l_line.reverse.index(destination_answer) - a_l_line.index("Union Square").abs
end

if line_answer == 'n' && second_line == '6' && destination_answer == ('Astor Place')
puts a_n_line.index(station_answer) + a_n_line.index("Union Square") + a_6_line.index(destination_answer) - a_6_line.index("Union Square").abs
end

if line_answer == 'n' && second_line == '6' && destination_answer == ('Grand Central' || '33rd' || '28th_6' || '23rd')
puts a_n_line.index(station_answer) + a_n_line.index("Union Square") + a_6_line.reverse.index(destination_answer) - a_6_line.index("Union Square").abs
end

# intersection = ["Times Square", "34th", "28th_n", "23rd", "Union Square", "8th_n"] & ["8th_l", "6th", "Union Square", "3rd", "1st"] & ["Grand Central", "33rd", "28th_6", "23rd", "Union Square", "Astor Place"]

# binding.pry
