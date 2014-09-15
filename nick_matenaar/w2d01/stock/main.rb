require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do 
	if params[:stock]
		@stock_symbol = params[:stock]
		@results = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock_symbol)
		if !@results[ @stock_symbol ].nil? 
			@price = @results[ @stock_symbol ].lastTrade 
			@name = @results[ @stock_symbol ].name
			@error = false 
		elsif !@stock_symbol.nil?
			@error = true 
		end 
	end

	erb :stock

end

# @stock_symbol = 'GOOG' # params[:stock]
# results = YahooFinance.get_quotes( YahooFinance::StandardQuote, @stock_symbol )
# price = results[ @stock_symbol ].lastTrade