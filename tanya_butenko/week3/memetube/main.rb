require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
	@videos = query_db 'SELECT * FROM videos'
	erb :index
end

get '/videos/new' do
	erb :new
end

get '/videos/:id' do #:id for any id
	query = "SELECT * FROM videos WHERE id=#{params['id']}"
	@video = query_db query
	@video = @video.first # strip off the array
	@url = @video['url'].partition('=').last
	redirect to ('/') unless @video
	erb :show
end

post '/videos/:id' do
	query = "UPDATE videos SET title='#{params['title']}', url='#{params['url']}', genre='#{params['genre']}', description='#{params['description']}' WHERE id=#{params['id']}"
	query_db query
	redirect to("/videos/#{params['id']}")
end

get '/videos/:id/edit' do
	query = "SELECT * FROM videos WHERE id=#{params['id']}"
	@video = query_db query
	@video = @video.first
	redirect to ('/') unless @video
	erb :edit
end

get '/videos/:id/delete' do
	query = "DELETE FROM videos WHERE id=#{params['id']}"
	query_db query
	redirect to('/')
end

post '/videos' do
	query = "INSERT INTO videos (title, url, genre, description) VALUES ('#{params['title']}', '#{params['url']}', '#{params['genre']}', '#{params['description']}')"
	query_db query
	redirect to('/')
end

get '/*' do  #if it's anything 
	redirect to ('/') #redirect to home page
end

def query_db(query)
	db = SQLite3::Database.new 'videos.db'
	db.results_as_hash = true
	result = db.execute query
	db.close
	result
end

