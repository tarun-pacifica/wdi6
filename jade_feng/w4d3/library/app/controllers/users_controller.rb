class UsersController < ApplicationController
	def index
		@users = User.all 	 # Calls out all the artists into a variable to show !
	end

	def new
		@user = User.new
	end

	def create
		user = User.create user_params
		redirect_to user
	end

	def show
		@user = User.find params[:id]
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		user = User.find params[:id]
		user.update user_params
		redirect_to user
	end

	def destroy
		user = User.find params[:id]
		user.destroy
		redirect_to users_path
	end

	private 	# Strong params to protect your params
	def user_params
		params.require(:user).permit(:name, :dob, :email, :image)
	end 

end
