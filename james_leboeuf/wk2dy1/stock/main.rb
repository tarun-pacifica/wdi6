# require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/stock' do
	if params[:stockname] #Only making request if user has valid request
	 @stockname = params[:stockname].upcase # Setting a variable
	 result = YahooFinance.get_quotes( YahooFinance::StandardQuote, @stockname )
	 @price = result[@stockname].lastTrade
	end
	erb :stock
end






