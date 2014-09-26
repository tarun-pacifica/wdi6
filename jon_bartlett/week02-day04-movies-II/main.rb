require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'


def movie_via_imdbid(imdbid)
  JSON.parse(HTTParty.get(URI.escape("http://www.omdbapi.com/?i=#{imdbid}")))
end

get '/'  do

	erb :home
end

get '/search' do

	imdbid = params['imdbid']

	unless imdbid.nil?
		@movie = movie_via_imdbid(imdbid)
		erb :poster	
	end

	film_name = params['film']

  unless film_name.nil?

	  @search_results = JSON.parse(HTTParty.get(URI.escape("http://www.omdbapi.com/?i=&s=#{ film_name }")))
	  
    if !@search_results["Response"].nil? || @search_results["Response"] != "False"

		  if @search_results["Search"].length == 1
		  	@movie = movie_via_imdbid(@search_results["Search"].first["imdbID"])

				erb :poster
			else

#		  	binding.pry

		  	erb :picker
		  end
    end
  else

  	@message = "Error occurred when fetching poster."

  	erb :poster

	end

end
