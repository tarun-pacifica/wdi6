class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to (user_path(user.id))
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @prices = Price.where(user_id: @user)
    @items = Item.where(user_id: @user)
    item = @items.each do |item|
      @item = item
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :password_confirmation)
  end

end