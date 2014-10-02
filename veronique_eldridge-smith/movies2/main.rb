require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'awesome_print'
require 'httparty'


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
	@title = params[:movie_selection]
	@movie_results = HTTParty.get("http://www.omdbapi.com/?i=#{@title}")
	@movie = JSON.parse @movie_results
	@result = @movie["Poster"]
	@result_title = @movie["Title"]
	@result_plot = @movie["Plot"]
	@result_runtime = @movie["Runtime"]
	@result_genre = @movie["Genre"]
	@result_actors = @movie["Actors"]
	erb :search

end


get '/poster' do 
	@hello = params[:movie_selection]
	
	# @title = params[:x].gsub(' ','+')
	# @movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{@title}")
	# @movie = JSON.parse @movie_results
	# if @movie['Poster'] == 'N/A'
	# 	@result = "http://imgcf.chia-anime.com/covt/cover/Gekkan-Shoujo-Nozaki-kun.jpg"
	# else
	# @result = @movie["Poster"]
	# end
	# @result_title = @movie["Title"]
	# @result_plot = @movie["Plot"]
	# @result_runtime = @movie["Runtime"]
	# @result_genre = @movie["Genre"]
	# @result_actors = @movie["Actors"]
	erb :poster

end
