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

def get_movie_hash(code)
	movie_http = HTTParty.get("http://www.omdbapi.com/?i=" + code)
	JSON.parse movie_http
end 

def get_rating(movie_hash)
	rating = (movie_hash['imdbRating'].to_f / 2).to_i
	rating_string = "" 
	rating.times do 
		rating_string << "&star;"
	end 
	rating_string
end 

def get_movie_name(movie_hash)
	movie_hash["Title"]
end 

def get_movie_poster(movie_hash)
	movie_hash["Poster"]
end 

def get_movie_id(movie_hash)
	movie_hash["imdbID"]
end

def search_result(string)
	string = string.split(' ').join('%20')
	result = HTTParty.get("http://www.omdbapi.com/?s=" + string)
	result = JSON.parse result
  result["Search"]
end 

def get_ids(result)
	ids = []
	result.each do |x|
		ids << x["imdbID"]
	end 
	ids
end 

def posters_of(codes_array=[])
	posters_hash = {}
	codes_array.each do |c|
		movie = get_movie_hash c
		movie_poster = get_movie_poster movie
		movie_id = get_movie_id movie
		posters_hash[movie_id] = movie_poster
	end 
	posters_hash
end 

def names_of(result)
	names_hash = {}
	result.each do |x|
		id = x["imdbID"]
		names_hash[id] = x["Title"]
	end
	names_hash
end 

get '/' do 
	erb :home
end

get '/search' do
	searched_for = params['search_string']
	search_res = search_result(searched_for)
	redirect ('/result/'+search_res[0]['imdbID']) if search_res[1].nil? 
	movie_names = names_of search_res
	result_ids = get_ids search_res
	poster_hash = posters_of result_ids
	@code = ""
	poster_hash.each do |code, url| 
		@code << '<a href="/result/'+code+'"><div class="resize"><h4>'+movie_names[code]+'</h4><img src="'+url+'"></div></a>'
	end 
	erb @code 
end 

get '/result/:id' do 
	# Check if movie is in the database
	unless Movie.exists? params[:id]
	# If it isn't, get the movie from OMDB and put it in the database, then show it
		movie_hash = get_movie_hash params[:id]
		@movie_title = get_movie_name movie_hash
		@movie_rating = get_rating movie_hash
		@movie_poster = get_movie_poster movie_hash
		@movie = Movie.create(title: @movie_title, rating: @movie_rating, poster: @movie_poster, id: params[:id])
	else
		@movie = Movie.find params[:id]	
	end 
	# If it is, show the movie from the database
	erb :result


	# Check if movie is in databsae
	
	# If it isnt, get the movie from OMDB and put it in
	# If it is, show it from database


end 
