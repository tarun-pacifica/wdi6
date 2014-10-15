require 'pry'
require 'sinatra'
require 'sinatra/reloader'

stations = {"N"=>['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
			"L"=>['8th', '6th', 'Union Square', '3rd', '1st'],
			"6"=>['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Aston Place']}



def trip_selection(n)
	start_stop = params["starting_point"]
	end_stop = params["stopping_point"]
	stop_num = (n.index(start_point) - n.index(end_point)).abs
	n.slice(n.index(start_point),stop_num + 1)
end 


get '/' do
	@stations = stations
	erb :search
end


get '/result' do 
	erb :result
end

