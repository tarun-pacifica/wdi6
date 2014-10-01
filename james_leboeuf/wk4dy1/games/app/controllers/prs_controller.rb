class PrsController < ApplicationController

	def index
	end

	def lookup
		choices = ["rock", "paper", "scissors"]
		@user_choice = params[:choice]
    @computer_choice = choices.sample
    @solution = solution
  end

  def solution
    if @user_choice == @computer_choice
      "Draw. Play again."
    elsif @user_choice == "rock" && @computer_choice == "scissors"
      "User wins. Rock beats scissors."
    elsif @user_choice == "rock" && @computer_choice == "paper"
      "Computer wins. Paper beats rock."
    elsif @user_choice == "paper" && @computer_choice == "scissors"
      "Computer wins. Scissors beats paper."
    elsif @user_choice == "paper" && @computer_choice == "rock"
      "User wins. Paper beats rock."
    elsif @user_choice == "scissors" && @computer_choice == "paper"
      "User wins. Scissors beats paper."
    elsif @user_choice == "scissors" && @computer_choice == "rock"
      "Computer wins. Rock beats scissors."
    end
  end

end