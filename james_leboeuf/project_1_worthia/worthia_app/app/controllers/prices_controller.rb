class PricesController < ApplicationController

  def create
    @price = Price.new(:price => params[:price].fetch(:price))
    @price.user = @current_user
    @item ||= Item.find(params[:price][:item_id])
    @item.prices << @price 

    if @price.save
      redirect_to @item
    else
      render "items/show"
    end
  end

end