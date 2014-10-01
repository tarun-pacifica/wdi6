require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :forms
end

get '/about' do
	erb :about
end

get '/faq' do
	erb :faq
end

get '/process' do
	#params.inspect  #params['']
	
	# @result ="#{params['hotdog_count']} #{params['hotdogs_style']} #{params['search']} consumed on "
	# erb @result
	erb params.inspect
end

get '/search' do
	erb :search
end

get '/search_results' do
	erb "You searched for #{ params['search_string']}"
end
