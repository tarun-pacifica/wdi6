# Memetube
# Create an app where users can add and view Youtube videos.

# From your homepage, the user can add a new video with a title, description, URL, and genre. The app should also let the user edit and delete videos.

require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'open-uri'
require 'nokogiri'

# get '/' do
# 		@butterflies = query_db 'SELECT * FROM butterflies'
# 		erb :index	
# end

before do 
	query = 'SELECT DISTINCT category FROM memetube'
	@categories = query_db query
end 

get '/' do 
	@tubes = query_db 'SELECT * FROM memetube'
	erb :index
end

get '/tubes/new' do
 	erb :new
end 

get '/category/:cat' do
	@tubes = query_db "SELECT * FROM memetube WHERE category='#{params[:cat]}'"
	erb :index
end 

post '/tubes' do 
	thumb = "http://img.youtube.com/vi/#{params['link'].partition("=").last.partition('&').first}/mqdefault.jpg"
	doc = Nokogiri::HTML(open(params['link']))
	category = doc.at_css(".content.watch-info-tag-list a").content
	title = doc.at_css("#eow-title").content
	query = "INSERT INTO memetube (title, link, thumbnail, category) VALUES ('#{title}', '#{params['link']}', '#{thumb}', '#{category}')"
	query_db query
	redirect to('/')
end 

get '/tubes/:id' do 
	query = "SELECT * FROM memetube WHERE id=#{params['id']}"
	@video = query_db query
	@video = @video.first # Strip off the array.
	@url = @video['link'].partition("=").last.partition('&').first
	redirect to('/') unless @video
	erb :show
end 

post '/tubes/:id' do 
	thumb = "http://img.youtube.com/vi/#{params['link'].partition('=').last.partition('&').first}/mqdefault.jpg"
	doc = Nokogiri::HTML(open(params['link']))
	category = doc.at_css(".content.watch-info-tag-list a").content
	title = doc.at_css("#eow-title").content
	query = "UPDATE memetube SET title='#{title}', link='#{params['link']}', thumbnail='#{thumb}', category='#{doc}' WHERE id=#{params['id']}"
	query_db query
	redirect to('/tubes/' + params['id'])
end 

get '/tubes/:id/edit' do
	query = "SELECT * FROM memetube WHERE id=#{params['id']}"
	@video = query_db query
	@video = @video.first
	redirect to('/') unless @video
	erb :edit
end 

get '/tubes/:id/delete' do 
	query = "DELETE FROM memetube WHERE id=#{params['id']}"
	query_db query
	redirect to('/')
end 

get '/*' do 
	redirect to('/')
end

def query_db(query)
	db = SQLite3::Database.new 'memetube.db'
	db.results_as_hash = true 
	result = db.execute query
	db.close
	result
end 
