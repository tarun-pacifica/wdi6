require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'

$posters_hash = {} # Hold URLS to poster imgs with search tags

get '/' do 
	erb :home
end

get '/search' do 
	# Get movie data into hash
	@movie_name = params['search_string']
	movie_url = @movie_name.split(' ').join('%20')
	movie = HTTParty.get("http://www.omdbapi.com/?t="+ movie_url)
	movie = JSON.parse movie

	# Check if real 
	unless movie['Error']
		@poster_url = movie['Poster']
		$posters_hash[@movie_name] = @poster_url
		rating = (movie['imdbRating'].to_f / 2).to_i
		@rating = "" 
		rating.times do 
			@rating << "&star;"
		end 
		
	else
		@error=true
	end
	erb :search
end 

get "/searchwall" do 
	@code = " "
	$posters_hash.each do |name, img|
		@code << '<a href="/search?search_string='+name+'"><img src="'+img+'" class="resize"></a>'
	end 
	erb :searchwall
end