class RockpaperscissorsController < ApplicationController
	def index
	end

	def result
		@generated_choice = ["rock", "paper", "scissors", "lizard", "spock"].sample
		@user_choice = params['user_answer']
		if @user_choice == "scissors" && (@generated_choice == "paper" || @generated_choice == "lizard")
			@outcome = "won"
			@answer = "You won!"

		elsif @user_choice == "paper" && (@generated_choice == "rock" || @generated_choice == "spock")
			@outcome = "won"
			@answer = "You won!"

		elsif @user_choice == "rock" && (@generated_choice == "lizard" || @generated_choice == "scissors")
			@outcome = "won"
			@answer = "You won!"

		elsif @user_choice == "lizard" && (@generated_choice == "spock" || @generated_choice == "paper")
			@outcome = "won"
			@answer = "You won!"

		elsif @user_choice == "spock" && (@generated_choice == "scissors" || @generated_choice == "rock")
			@outcome = "won"
			@answer = "You won!"

		elsif @user_choice == @generated_choice
			@outcome = "tie"
			@answer = "There was a tie!"

		else
			@outcome = "lost"
			@answer = "You lost!"
		end

		if @user_choice == "paper"
			@user_img = '/assets/paper.jpg'
		elsif @user_choice == "scissors"
			@user_img = '/assets/scissors.jpg'
		elsif @user_choice == "rock"
			@user_img = '/assets/rock.jpg'
		elsif @user_choice == "lizard"
			@user_img = '/assets/lizard.jpg'
		elsif @user_choice == "spock"
			@user_img = '/assets/spock.jpg'
		end

		if @generated_choice == "paper"
			@generated_img = '/assets/paper.jpg'
		elsif @generated_choice == "scissors"
			@generated_img = '/assets/scissors.jpg'
		elsif @generated_choice == "rock"
			@generated_img = '/assets/rock.jpg'
		elsif @generated_choice == "lizard"
			@generated_img = '/assets/lizard.jpg'
		elsif @generated_choice == "spock"
			@generated_img = '/assets/spock.jpg'
		end

		if @outcome == "won"
			@outcome_img = "/assets/won.png"
		elsif @outcome == "tie"
			@outcome_img = "/assets/tie.png"			
		elsif @outcome == "lost"
			@outcome_img = "/assets/lost.png"
		end

	end
end 

