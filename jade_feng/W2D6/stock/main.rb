require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do
	if params[:stock_symbol]
		@stock_symbol = params[:stock_symbol].upcase
		@results = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock_symbol )
		@price = @results[@stock_symbol].lastTrade if @stock_symbol 
		@name = @results[@stock_symbol].name if @stock_symbol 
		@volume = @results[@stock_symbol].averageDailyVolume if @stock_symbol
		@date = @results[@stock_symbol].time if @stock_symbol
		@year = @results[@stock_symbol].date if @stock_symbol
		@rangeLOW = @results[@stock_symbol].dayLow if @stock_symbol
		@rangeHIGH = @results[@stock_symbol].dayHigh if @stock_symbol
	end
erb :Stock
end

