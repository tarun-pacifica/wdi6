require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do 
	erb :new
end

post '/' do 
	# Create db object with file "receipts.txt", create the file if it doesn't exist
	db = File.new('receipts.txt', 'a+')

	# Set local variables from the form data, service and cost
	@service = params['service']
	@cost = params['cost']

	# puts the service and cost into the file, seperated by a comma.
	# eg: "Mow the lawn, 100"
	db.puts @service + ',' + @cost

	# Close the file to save changes
	db.close

	# go to the view receipt
	erb :receipt
end 

get '/all' do
	# Open the file "receipts.txt" from the top of the file ('r')
	db = File.new('receipts.txt', 'r')

	# Create a hash to hold all the receipts from the file
	# The hash will look like
	# SERVICE : COST
	@receipts = {}

	# Loop through each line in the file 'receipts.txt', save that line as the variable line
	db.each do |line|

		# Create an array with the contents of the line, split by each comma.
		# The array will look like this
		# ['lawn mowing', '100']
		line_array = line.split(',')

		# Save the data in the array, to the hash, so that the hash can be called like
		# @receipts['lawn mowing']
		# which returns => '100'
		@receipts[line_array[0]] = line_array[1]

	end 

	# Close file again
	db.close

	# Go the the "all" view
	erb :all
end
