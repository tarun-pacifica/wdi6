class WondersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@wonders = Wonder.all
	end

	def new
	end

	def create
		wonder = Wonder.create wonder_params
		redirect_to(wonders_path)
	end

	def show
		@wonder = Wonder.find params[:id]
	end

	def destroy
		wonder = Wonder.find params[:id]
		wonder.destroy
		redirect_to(wonders_path)
	end

	def edit
		@wonder = Wonder.find params[:id]
	end

	def update
		wonder = Wonder.find params[:id]
		wonder.update wonder_params
		redirect_to(wonder_path(wonder.id))
	end

	private
	def wonder_params
		params.require(:wonder).permit(:name, :country, :continent, :year_declared, :description)
	end

end