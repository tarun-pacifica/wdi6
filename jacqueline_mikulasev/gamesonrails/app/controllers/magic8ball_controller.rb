class Magic8ballController < ApplicationController
	def question
		if params[:question]
			@possible_answers = ["It is certain", "It is decidedly so", "Yes definitely", "You may rely on it", "As I see it yes", "Most likely", "Outlook good", "Yes, Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful", "No"]
			@answer = @possible_answers.sample
		end
	end

	# def result

	# end

	# def index 
	# end

	# def input
	# 	user_input = 
	# end
end