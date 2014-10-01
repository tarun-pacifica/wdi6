require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do 
	unless params[:name].nil?
		@name = params[:name].upcase

		results = YahooFinance::get_quotes( YahooFinance::StandardQuote, @name )

		@result = results[ @name ].lastTrade 
	end

	erb :stock
end