class RpsController < ApplicationController


	def index
		$ai_choice = %w[rock paper scissors].sample
	end

	def play
		@choice = params[:choice]
		if @choice == $ai_choice
			@result = 1 # tie 
		elsif @choice == "rock" && $ai_choice == "scissors"
			@result = 2 # win 
		elsif @choice == "rock" && $ai_choice == "paper"
			@result = 3 # lose 
		elsif @choice == "paper" && $ai_choice == "rock"
			@result = 2 # win 
		elsif @choice == "paper" && $ai_choice == "scissors"
			@result = 3 # lose 
		elsif @choice == "scissors" && $ai_choice == "paper"
			@result = 2 # win 
		elsif @choice == "scissors" && $ai_choice == "rock"
			@result = 3 # lose 
		end 		
	end 
end 

