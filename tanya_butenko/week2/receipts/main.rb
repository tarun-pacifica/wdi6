require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do 
	erb :new
end


post '/' do
	db = File.new('receipt_db.txt', 'a+')
	input = params['service'], params['cost']
	
	db.puts(input.join(','))

	db.close
	erb :receipt
end

get '/all' do
	db = File.new('receipt_db.txt', 'r')
	@receipts = {}

	db.each do |line|
		#puts line.upcase #can use methods on it
		line_array = line.chomp.split(',')
		@receipts[line_array[0]] = line_array[1]

	end

	db.close

	erb :all

end

