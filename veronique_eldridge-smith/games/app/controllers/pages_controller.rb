class PagesController < ApplicationController
	def home
	end

	def magicball
	end

	def magicball_result
		@question = params[:question]

		answer_array = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

		@answer = answer_array.sample
	end

	def secretnum
	end

	def secretnum_result
		@number = params[:number].to_i

		@result = Random.rand(1..10).to_i

		if @number == @result
			@message = "WOOHOO YOU GOT IT!"
		else
			@message = "NOPE! YOU LOSE!"
		end

	end

	def rockpaperscissors
	end

	def rockpaperscissors_result
		@object = params[:object]

		selection = ["rock","paper","scissors","lizard","spock"]
		@answer = selection.sample

		if @answer == "scissors"
			if @object == "paper" || "lizard"
				@response = "YOU WIN"
			else
				@response = "YOU LOSE"
			end
		elsif @answer == "paper"
			if @object == "rock" || "spock"
				@response = "YOU WIN"
			else
				@response = "YOU LOSE"
			end
		elsif @answer == "rock"
			if @object == "lizard" || "scissors"
				@response = "YOU WIN"
			else
				@response = "YOU LOSE"
			end
		elsif @answer == "lizard"
			if @object == "spock" || "paper"
			@response = "YOU WIN"
			else
			@response = "YOU LOSE"
			end
		else
			if @object == "scissors" || "rock"
				@response = "YOU WIN"
			else
				@response = "YOU LOSE"
			end
		end
	end

end

