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
    @item = Item.create item_params
    @item.prices << Price.create(:price => params[:price])
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update item_params
    redirect_to item
  end

  def destroy
    item = Item.find params[:id]
    item.destroy
    redirect_to item
  end

  private
  def item_params
    params.require(:item).permit(
      :name, 
      :content, 
      :image, 
      prices_attributes: [:price]
    )
  end

end