require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do 
	erb :search
end

get '/search_result' do
	search_input = params['movie_input'].gsub(' ','+') #get the user's input and replace spaces with + to match syntax of omdbapi
	search_results_raw = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ search_input }") #get data from omdbapi based on search keyword. Will spit out data like this: ""Search":[{"Title":"Jurassic Park","Year":"1993","imdbID":"tt0107290","Type":"movie"},{"Title":"The Lost World: Jurassic Park","Year":"1997","imdbID":"tt0119567","Type":"movie"},........}]"
	@search_results = JSON.parse search_results_raw #convert data into a hash with key "Search" and a large value in an array which contains a hash again looking like this: "{"Search"=>[{"Title"=>"Jaws", "Year"=>"1975", "imdbID"=>"tt0073195", "Type"=>"movie"},{"Title"=>"Jaws 2", "Year"=>"1978", "imdbID"=>"tt0077766", "Type"=>"movie"},.....]}"
	@movies_results = @search_results["Search"] #This gets rid of the "Search" key and leaves us with an array of hashes looking like this: "[{"Title"=>"Jaws", "Year"=>"1975", "imdbID"=>"tt0073195", "Type"=>"movie"},{"Title"=>"Jaws 2", "Year"=>"1978", "imdbID"=>"tt0077766", "Type"=>"movie"},....]"
		if @movies_results.nil?
			redirect to '/'
		elsif @movies_results.length == 1
			# binding.pry
			sole_movie = @movies_results[0]['Title'].gsub(' ','+')
			redirect to "/movies/#{sole_movie}"
		end 
		
	# @movie_titles = []
	# @movies_results.each { |movie| @movie_titles << movie['Title'] }
	# @movie_data = JSON.parse HTTParty.get("http://www.omdbapi.com/?i=&i=#{ search_input }")
	 erb :search_result
end

get '/movies/:title' do
	@movie_title = params[:title]
	movie_raw = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @movie_title }") 
	@movie = JSON.parse movie_raw 
	@poster = @movie['Poster'].to_s
	redirect to('/movies') unless @movie_title
	erb :result
end

# binding.pry
