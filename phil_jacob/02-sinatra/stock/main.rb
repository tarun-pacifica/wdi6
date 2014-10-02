require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/stock' do
	@stock_symbol = params[:stockname].upcase
	@results = YahooFinance::get_quotes( YahooFinance::StandardQuote, @stock_symbol )
	if !@results[ @stock_symbol ].nil?
		@price = @results[ @stock_symbol ].lastTrade
		@name = @results[ @stock_symbol ].name
	end
	erb :stock
end

# get '/about' do
# 	erb :about
# end

# get '/stock' do
# 	@first = params[:first].to_f
# 	@second = params[:second].to_f
# 	@result = case params[:operator]
# 	when '+' then @result = @first + @second
# 	when '-' then @result = @first - @second
# 	when '*' then @result = @first * @second
# 	when '/' then @result = @first / @second
# 	end
# 	erb :calc
# end

# get '/calc/add/:x/:y' do
# 	@result = params[:first].to_f + params[:second].to_f
#  	erb :calc
# end


	