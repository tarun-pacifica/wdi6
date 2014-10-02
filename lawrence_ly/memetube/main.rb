
require "sinatra"
require "sinatra/reloader"
require "pry"
require "URI"
require "CGI"

require "sqlite3"

## URI.parse (url).query

get '/' do
	@memes = query_db "SELECT * FROM memes" #  WHERE id=#{params['id']}"
	erb :index
end

get '/memes/:id/edit' do
	erb :edit
end

get 'memes/new' do
	erb :new
end


get '/*' do
  redirect to('/')
end

def query_db(query)
  puts "Preparing to execute query: #{ query }"
  db = SQLite3::Database.new 'memes.db'
  db.results_as_hash = true
  result = db.execute query
  db.close
  result
end