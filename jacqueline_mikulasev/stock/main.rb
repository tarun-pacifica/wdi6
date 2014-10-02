require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'
require 'pry'

get '/stock' do
# binding.pry
if params[:stock] #only makes request to yahoo if user inputs something proper
	@stock = params[:stock]
	result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock)
	@price = result[@stock].lastTrade
	@previousclose = result[@stock].previousClose
end

erb :stock

end



# 	@stock_symbol = params[:stock]
# 	@result = params[:YahooFinance]YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock_symbol
# 	@price = @results[:stock_symbol].lastTrade
# end

# # @stock_symbol = 'GOOG' # params[:stock]
# # results = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock_symbol )
# # price = results[ @stock_symbol ].lastTrade



