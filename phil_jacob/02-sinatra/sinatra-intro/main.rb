require 'pry'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
	"COMING SOON"
end

get '/hello' do
	"OMFG NO MORE F****ING MENUS!!!!! Hello world, from Sinatra. Phil "

end

get '/lamp' do
	"I love lamp"
end

get '/phil' do
	"Hello Phil, you good thing, you."
end

#  def hi(name)
# "Hello #{ name }"
# end

get '/hi/:something' do
	"Hello #{ params[:something] }, you good thing, you"
end

get "/hi/:first/:last" do
	"Your first name is #{ params[:first]} and your last name is #{ params[:last]}"
end

get '/hi/:first/:last/:age' do
	"Your first name is #{params[:first]} and your last name is #{ params[:last] } and you are #{ params[:age]} years old."
end

get '/calc/multiply/:x/:y' do
	result = params[:x].to_f * params[:y].to_f
	"the result is #{ result }"
end