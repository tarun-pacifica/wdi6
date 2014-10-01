class SecretnumberController < ApplicationController

	def index
		$number = rand(10)
	end 

	def guess
		@user_guess = params[:user_guess].to_i
		if $number == @user_guess
			@result = 1
		elsif $number > @user_guess
			@result = 2
		elsif $number < @user_guess
			@result = 3
		end 
	end 
end