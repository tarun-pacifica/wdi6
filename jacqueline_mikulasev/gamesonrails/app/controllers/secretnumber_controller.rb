class SecretnumberController < ApplicationController
	def secret
	end

	def user_input
		@number = (1...10).to_a
		@computer_number = @number.sample
		@user_input = params[:number]
		if @user_input == @computer_number
				@reply = "You guessed right!"
		else
				@reply = "Wrong, guess again!"
		end
		render :number
	end
end
