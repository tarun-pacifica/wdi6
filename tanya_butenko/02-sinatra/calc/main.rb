require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/calc' do
	@first = params[:first].to_f
	@second = params['second'].to_f #symbol or string no difference
	# case params[:operator]
	# when '+' then @result = @first + @second
	# when '-' then @result = @first - @second
	# end
	@result = case params[:operator]
	when '+' then @first + @second
	when '-' then @first - @second
	when '*' then @first * @second
	when '/' then @first / @second
	end

	erb :calc

end
