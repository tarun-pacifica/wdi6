require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do # /  is the route
	if params[:stockname] # Only making request if user has valid request
	 @user_input_stock = params[:stockname].upcase # Setting a variable
	 result = YahooFinance.get_quotes( YahooFinance::StandardQuote, @user_input_stock )
	 @price = result[@user_input_stock].lastTrade
	end
	erb :stock
end







