# Create an app where users can add and view Youtube videos.
# From your homepage, the user can add a new video with a title, description, URL_code, and genre. The app should also let the user edit and delete videos.

require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require 'sqlite3'

require 'uri'
require 'cgi'


before do
	@videos = query_db 'SELECT DISTINCT genre FROM videos'
end

get '/' do 
	@videos = query_db 'SELECT * FROM videos'
	@genre = query_db 'SELECT DISTINCT genre FROM videos'

	erb :index # Calling it index since it calls for an index of videos
end

get '/videos/new' do
	erb :new
end

post '/videos' do
	query = "INSERT INTO videos (title, description, URL_code, genre) VALUES ('#{params['title']}', '#{params['description']}', '#{params['URL_code']}', '#{params['genre']}'  )"  
	query_db query 
	redirect to ('/') 			# Redirects back to home page to see new video
end

get '/videos/:id' do
	query = "SELECT * FROM videos WHERE id=#{params['id']}"
	@video = query_db query
	@video = @video.first 	# Strip off the array
	
	@youtube_id = CGI.parse( URI.parse(@video['URL_code']).query )['v'][0]

	redirect to ('/') unless @video
	erb :show
end

post '/videos/:id' do
	query = "UPDATE videos SET title='#{params['title']}', description='#{params['description']}', URL_code='#{params['URL_code']}', genre='#{params['genre']}'  where id = #{params['id']}"
	query_db query
	redirect to ("/videos/#{params['id']}")
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
	redirect to ('/')
end


get '/videos/genre/:genre' do
  @videos = Video.where(:genre => params[:genre])
  erb :index
end

def query_db(query) 	# Makes the query process general
	puts "Preparing to run a query: #{query}"
	db = SQLite3::Database.new 'videos.db'  		
	db.results_as_hash = true 						
	result = db.execute query 	# Execute - Pulls out data from database
	db.close 					# Close the db
	result 						# Come back with the result
end


