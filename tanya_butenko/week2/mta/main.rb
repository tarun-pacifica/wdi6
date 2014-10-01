require 'sinatra'
require 'sinatra/reloader'

subway = {
	"N" => ["Times Square", "34", "28", "23", "Union Square", "8"],
	"L" => ["8", "6", "Union Square", "3", "1"],
	"6" => ["Grand Central", "33", "28", "23", "Union Square", "Astor Place"]
}

get '/' do 
	@subway = subway
	erb :mta
end

get '/result' do

	@subway = subway

	@departure = params['departure_station'].split(',')
	@arrival = params['arrival_station'].split(',')

	if @departure[0] == @arrival[0]

		#gets the index number of departure and arrival station and substracts it
		n = @subway[@departure[0]].find_index(@arrival[1]) - @subway[@departure[0]].find_index(@departure[1])
		@result = n.abs #gets the abstract number
	
	else
		#finds the common station for all 3 lines
		@com_station = (@subway["N"] & @subway["L"] & @subway["6"]).shift

		n = @subway[@departure[0]].find_index(@com_station) - @subway[@departure[0]].find_index(@departure[1])
		n2 = @subway[@arrival[0]].find_index(@com_station) - @subway[@arrival[0]].find_index(@arrival[1])
		@result = n.abs + n2.abs
	
	end

	@result

	erb :result
end