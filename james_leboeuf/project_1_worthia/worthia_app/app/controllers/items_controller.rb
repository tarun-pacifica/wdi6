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
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @id = params[:id]
    @item = Item.find(params[:id])
    @price_item = Price.where(item_id: @id)
    @prices = @price_item.map { |x| x.price }
    @average = @prices.inject { |sum, n| sum + n }.to_f / @prices.size
  end

  def edit
    @item = Item.find(params[:id])
  end

  def valuate
    @item_id = params[:item_id] 
    @price = Price.new
    if @price.save
      flash[:notice] = "New Price Added"
      redirect_to :action => :show, :id => @price.item_id
    end
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
      :address,
      prices: [:price, :item_id, :user_id, :_destroy]
    )
  end

end