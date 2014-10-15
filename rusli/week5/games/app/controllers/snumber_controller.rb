class SnumberController < ApplicationController
	def index
		@number = rand(11)
		@answer = params[:guess]
	end

end
