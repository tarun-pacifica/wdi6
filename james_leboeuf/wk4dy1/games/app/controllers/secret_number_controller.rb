class SecretNumberController < ApplicationController
# Users click a number between 1 and 10. The controller validates the guess and renders the win or lose view.
	def index
	end

	def lookup
		set_number unless session[:number].present?
		@user_guess = params[:number].to_i
		@compare = compare
	end

	def secret
		@secret_number = rand(1..10)
	end

	def set_number
    session[:number] = secret
  end

	def compare
		if @user_guess == session[:number]
			set_number # Starts a new game when the user wins.
			"Good guess"
		else
			"Guess again"
		end
	end

end