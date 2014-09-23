require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
:adapter => 'sqlite3',
:database => 'movies.db'
)

require_relative 'movie'

before do
	@searchs = Movie.select(:search).uniq
end 

after do 
	ActiveRecord::Base.connection.close
end

get '/' do #show all the previously searched movies
	@movies = Movie.all
	erb :index
end

get '/search' do #run a get request to /search, which runs the search erb file
	unless params[:movie_name].nil? #if params has a key called movie name... run this code
		@params = params[:movie_name].downcase
		@movies = Movie.where("name = '#{@params}'")
		# binding.pry
		unless @movies.nil?
			erb :results
		else
			@name = params['movie_name'].gsub(' ', '+')
			@results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @name }")
			@movielist = JSON.parse @results
			@movie =  Movie.new
			@movie.name = @movielist['Title']
			@movie.poster = @movielist['Poster']
			@movie.plot = @movielist['Plot']
			@movie.save
			# binding.pry
			redirect to('/results')			
		end 
	else
		erb :search #goto search page
	end
end

get '/results' do
	erb :results
end

get '/movies/:id' do
	@movie = Movie.find params[:id]
	redirect to('/') unless @movie
	erb :show
end

post '/movies/:id' do
	movie = Movie.find params[:id]
	movie.movie = params [:movie]
	movie.search = params [:search]
	movie.save
	redirect to ("/movies/#{movie.id}")
end

# get '/movies/:id/delete' do
# 	movie = Movie.find params [:id]
# 	movie.destroy
# 	redirect to ('/')
# end

get '/*' do
	redirect to ('/')
end





