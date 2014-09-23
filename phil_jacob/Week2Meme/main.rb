require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'uri'
require 'cgi'

# C /funnymemes/new *GET REQUEST, THEN POST IN .ERB*     #SQL Command INERT
# R /funnymemes			   #SQL Command SELECT
# U /funnymemes/17/edit #SQL Command UPDATE
# D /funnymemes/17 		 #SQL Command DELETE

get '/' do
	@funnymemes = query_db 'SELECT * FROM funnymemes'
	erb :index
end

get '/funnymemes/new' do
	erb :new
end

get '/funnymemes/:id' do
	query = "SELECT * FROM funnymemes WHERE id=#{params['id']}"
	@funnymemes = query_db query
	@funnymemes = @funnymemes.first # Strip off the array.
	parts = CGI.parse( URI.parse(@funnymemes['url']).query )
	@youtube_id = parts['v'].first
	redirect to('/') unless @funnymemes
	erb :show
end

post '/funnymemes/:id' do
	parts = CGI.parse( URI.parse(params['url']).query )
	@youtube_id = parts['v'].first
	thumb = "http://img.youtube.com/vi/#{@youtube_id}/mqdefault.jpg"
	query = "UPDATE funnymemes SET title='#{params['title']}', url='#{params['url']}', genre='#{params['genre']}', thumb='#{thumb}' WHERE id=#{params['id']}"
	query_db query
	redirect to("/funnymemes/#{params['id']}")
end


get '/funnymemes/:id/edit' do
	query = "SELECT * FROM funnymemes WHERE id=#{params['id']}"
	@funnymemes = query_db query
	@funnymemes = @funnymemes.first
	redirect to('/') unless @funnymemes
	erb :edit
end

get '/funnymemes/:id/delete' do
	query = "DELETE FROM funnymemes WHERE id=#{params['id']}"
	query_db query
	redirect to('/')
end

post '/funnymemes' do
	parts = CGI.parse( URI.parse(params['url']).query )
	@youtube_id = parts['v'].first
	thumb = "http://img.youtube.com/vi/#{@youtube_id}/mqdefault.jpg"
	query = "INSERT INTO funnymemes (title, url, genre, thumb) VALUES ('#{params['title']}', '#{params['url']}', '#{params['genre']}', '#{thumb}')"
	query_db query
	redirect to('/')
end



def query_db(query)
	db = SQLite3::Database.new 'funnymemes.db'
	db.results_as_hash = true
	result = db.execute query
	db.close
	result
end


