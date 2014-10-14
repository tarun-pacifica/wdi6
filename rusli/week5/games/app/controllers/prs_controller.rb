class PrsController < ApplicationController
	def index
		game = ["rock", "paper", "scissors"]
		@computer = game.sample
		@answer = params[:game]
	end
end
