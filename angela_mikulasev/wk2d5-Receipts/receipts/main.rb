require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do 
	erb :new
end

post '/' do 
	db = File.new('receipts.txt', 'a+')

	@service = params['service']
	@cost = params['cost']
	db.puts @service + ',' + @cost

	db.close

	erb :receipt
end 

get '/all' do
	db = File.new('receipts.txt', 'r')

	@receipts = {}

	db.each do |print_receipt|
		print_receipt = print_receipt.split(',')
		@receipts[print_receipt[0]] = print_receipt[1]
	end 

	db.close

	erb :all
end