require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'uri'
require 'cgi'

# C /youtube/new *GET REQUEST, THEN POST IN .ERB*     #SQL Command INERT
# R /youtube			   #SQL Command SELECT
# U /youtube/17/edit #SQL Command UPDATE
# D /youtube/17 		 #SQL Command DELETE

before do
	@categories = query_db 'SELECT DISTINCT genre FROM youtube'
end

get '/' do
	@youtube = query_db 'SELECT * FROM youtube'
	@categories = query_db 'SELECT DISTINCT genre FROM youtube'
	erb :index
end

get '/youtube/new' do
	erb :new
end

get '/youtube/:id' do
	query = "SELECT * FROM youtube WHERE id=#{params['id']}"
	@youtube = query_db query
	@youtube = @youtube.first # Strip off the array.
	parts = CGI.parse( URI.parse(@youtube['url']).query )
	@youtube_id = parts['v'].first
	redirect to('/') unless @youtube
	erb :show
end

post '/youtube/:id' do
	parts = CGI.parse( URI.parse(params['url']).query )
	@youtube_id = parts['v'].first
	thumb = "http://img.youtube.com/vi/#{@youtube_id}/mqdefault.jpg"
	query = "UPDATE youtube SET title='#{params['title']}', url='#{params['url']}', genre='#{params['genre']}', thumb='#{thumb}' WHERE id=#{params['id']}"
	query_db query
	redirect to("/youtube/#{params['id']}")
end


get '/youtube/:id/edit' do
	query = "SELECT * FROM youtube WHERE id=#{params['id']}"
	@youtube = query_db query
	@youtube = @youtube.first
	redirect to('/') unless @youtube
	erb :edit
end

get '/youtube/:id/delete' do
	query = "DELETE FROM youtube WHERE id=#{params['id']}"
	query_db query
	redirect to('/')
end

post '/youtube' do
	parts = CGI.parse( URI.parse(params['url']).query )
	@youtube_id = parts['v'].first
	thumb = "http://img.youtube.com/vi/#{@youtube_id}/mqdefault.jpg"
	query = "INSERT INTO youtube (title, url, genre, thumb) VALUES ('#{params['title']}', '#{params['url']}', '#{params['genre']}', '#{thumb}')"
	query_db query
	redirect to('/')
end



def query_db(query)
	db = SQLite3::Database.new 'youtube.db'
	db.results_as_hash = true
	result = db.execute query
	db.close
	result
end











