class PagesController < ApplicationController

	skip_before_action :verify_authenticity_token
	
	def home
	end
	def magic
	end
	def magic_response
		@response = [ "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful""It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it"]

	end
	def secret
		@number = rand(11)
		@answer = params[:guess]
	end
	def secret_answer
		@number = params[:hidden]
		@answer = params[:guess]
	end
	def rcp
	end
	def rcp_result
		rcp = ["rock", "paper", "scissors"]
		@computer_throw = rcp.sample
		@p_throw = params[:game]
	end

end













