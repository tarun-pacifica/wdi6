class RockpaperscissorsController < ApplicationController
	def index
	end

	def result
		random_number = rand(0..4)
		options = ["rock", "paper", "scissors", "lizard", "spock"]
		@generated_choice = options[random_number]
		@user_choice = params['user_answer']
		if @user_choice == "scissors" && (@generated_choice == "paper" || @generated_choice == "lizard")
			@answer = "You won!"
		elsif @user_choice == "paper" && (@generated_choice == "rock" || @generated_choice == "spock")
			@answer = "You won!"

		elsif @user_choice == "rock" && (@generated_choice == "lizard" || @generated_choice == "scissors")
			@answer = "You won!"

		elsif @user_choice == "lizard" && (@generated_choice == "spock" || @generated_choice == "paper")
			@answer = "You won!"

		elsif @user_choice == "spock" && (@generated_choice == "scissors" || @generated_choice == "rock")
			@answer = "You won!"

		else
			@answer = "You lost!"
		end

	end
end 

