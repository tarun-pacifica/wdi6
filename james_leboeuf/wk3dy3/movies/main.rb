require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

require_relative 'movie'

after do
	ActiveRecord::Base.connection.close
end

get '/' do #Sinatra will serve up anything here and in public automatically
	erb :forms
end

get '/search_results' do #Diplaying multiple results
	@movies = get_movies(params["movie_title"])
	erb :search_results
end

get '/search_id' do #Displaying solo movie
	imdb_id = params['imdbID']
	@movie = Movie.find_by(imdbid: imdb_id) #find_by(COLUMN NAME: VALUE)
	# binding.pry #Go into pry and do @movie to search if it's nil, or it returns values from the sqlite3 database.
	unless @movie
    m = get_movie(imdb_id) # get_movie gets entire hash. 
    @movie = Movie.new( title: m["Title"], imdbid: m["imdbID"], poster: m["Poster"],
    plot: m["Plot"], year: m["Year"] ) # create new movie object. We also filter out what we want to our database from the huge search hash that we got.
    @movie.save
  end
  erb :search_id
end

def get_movies(movie_title) # When you create a new function, it's always best practice to not throw in boolean statements (i.e. if, else, elsif). Just leave it to do it's one job.
	@title = movie_title.gsub(' ','+')
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")
	if movie_results 
		JSON.parse(movie_results)
  else 
	  {} # Sometimes when you send a request, it's a nil value and will be returned, so it's better the save it in an empty hash.
	end  
end

def get_movie(imdb_id)
	movie = HTTParty.get("http://www.omdbapi.com/?i=#{ imdb_id }")
	if movie
		JSON.parse(movie)
	else
		{}
	end
end





