require 'sinatra'
require 'sinatra/reloader'

get '/home' do
	if params[:yes]
		@yes = params[:yes]
		result = '/pass'
end
erb :home
end

get '/home' do
	if params[:no]
		@no = params[:no]
		result = '/write_test'
end
erb :home
end

get '/pass' do
	if params[:yes]
		@yes = params[:yes]
		result = '/refactor'
end
erb :pass
end
get '/pass' do
	if params[:no]
		@no = params[:no]
		result = '/write_code'
end
erb :pass
end

get '/write_test' do
	if params[:done]
		@done = params[:done]
		result = '/pass'
end
erb :write_test
end

get '/write_code' do
	if params[:done]
		@done = params[:done]
		result = '/pass'
end
erb :write_code
end

get '/refactor' do
	if params[:done]
		@done = params[:done]
		result = '/pass'
end
erb :refactor
end

get '/new_feature' do
	if params[:continue]
		@continue = params[:continue]
		result = '/home'
end
erb :new_feature
end

get '/do_refactor' do
	if params[:done]
		@done = params[:done]
		result = '/pass'
end
erb :do_refactor
end