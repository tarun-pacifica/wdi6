class ItemsController < ApplicationController
  def index
    @items = Item.text_search(params[:query])
  end

  def new
    if @current_user.present?
    @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    item = Item.create item_params
    item.user_id = @current_user.id
    item.save
    redirect_to item
  end

  def show
    @items = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :user_id, :image)
  end

end