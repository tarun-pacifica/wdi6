require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'httparty'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

require_relative 'movies'

after do
  ActiveRecord::Base.connection.close
end

get '/' do 
	erb :search
end

get '/options' do
	@title = params[:movie_title].gsub(' ','+')
	@movie_results = HTTParty.get("http://www.omdbapi.com/?s=#{@title}")
	@movie = JSON.parse @movie_results
	@movies = @movie["Search"]

	@results = {}
	@movies.each do |line|
		@results[line['Title']] = line['imdbID']
	end

	erb :options

end


get '/search' do 

	##checks if it's in the database already##
	@imdbID = Movie.find_by_imdbID(params[:movie_selection])

	## if it's not in the database do this
		if @imdbID.nil?
			@imdbID = params[:movie_selection]
			@movie_results = HTTParty.get("http://www.omdbapi.com/?i=#{@imdbID}")
			@movie = JSON.parse @movie_results

			@movies = Movie.new
			@movies.image = @movie["Poster"]
			@movies.name = @movie["Title"]
			@movies.description = @movie["Plot"]
			@movies.runtime = @movie["Runtime"]
			@movies.genre = @movie["Genre"]
			@movies.actors = @movie["Actors"]
			@movies.save

		
		end
	

	erb :search

end



