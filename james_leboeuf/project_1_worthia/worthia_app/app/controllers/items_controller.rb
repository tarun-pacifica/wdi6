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
    @item.prices << Price.create(:price => params[:price].fetch(:price), :user_id => session[:user_id] )
    if @item.save
      # raise "error"
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @id = params[:id]
    @items = Item.find(params[:id])
    if @price_item = Price.find_by(item_id: @id)
      @price = @price_item[:price]
    else
      []
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @id = params[:id]
    @price_item = Price.find_by(item_id: @id)
    @price_item_id = @price_item.id
    item = Item.find(params[:id])
    item.update item_params
    item.prices.update(@price_item_id, :price => params[:price].fetch(:price))
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
      prices_attributes: [:price, :item_id, :user_id, :_destroy]
    )
  end

end