# require 'sinatra'
# require 'sinatra/reloader'
# require 'pry'

# # require './models/trains'

# get '/trains' do 
# 	erb :trains
# end

# train_stations = {
# 'n' => ["8th", "TimesSquare", "UnionSquare", "23rd", "34th"]
# 'l' =>["8th", "6th", "UnionSquare", "3rd", "1st"]
# 'six' => ["GrandCentral", "33rd", "28th", "UnionSquare", "AstorPlace"]
# }

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require './models/mta_single' #calling the models file and connecting it to the main.rb

get '/mta_single/lines' do         	# make this a link  # get = can accesss the page no matter what.. no order to the page
  erb 'mta_single/lines'.to_sym
end

post '/mta_single/stations' do
  @line = params['line'] 		# params is like gets chomp # it is calling whatever you called in def stations in MTAsingle.rb  #post = you must go through the order to get to this page
  erb 'mta_single/stations'.to_sym #go to your stations.erb
end

post '/mta_single/results' do    #we now have user input for @line so we can now move onto results calculation
  @mta = MtaSingle.new #go to mtasingle.rb class and create a new user options/file
  @mta.line = params['line'] #get the info of which line the user inputs 
  @mta.departure_station = params['departure_station'] #use the above info to find the departure station
  @mta.destination_station = params['destination_station'] #use the above info to find the arrival station

  erb 'mta_single/results'.to_sym #calling the variable
end