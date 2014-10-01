class MountainsController < ApplicationController 
	skip_before_filter :verify_authenticity_token
	def index 
		@mountains = Mountain.all
	end 

	def new
	end 

	def create
		Mountain.create mountain_params
		redirect_to mountains_path
	end 

	def show
		@mountain = Mountain.find params[:id]
	end

	def edit
		@mountain = Mountain.find params[:id]
	end 

	def update
		mountain = Mountain.find params[:id]
		mountain.update mountain_params
		redirect_to mountain_path(mountain.id)
	end 

	def destroy
		mountain = Mountain.find params[:id]
		mountain.destroy
		redirect_to mountains_path
	end 

	private
	def mountain_params
		params.require(:mountain).permit(:name, :height, :image)
	end 
end 
