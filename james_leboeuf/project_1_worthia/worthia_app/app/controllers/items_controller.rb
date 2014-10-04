class ItemsController < ApplicationController
  def index
    @items = Item.text_search(params[:query])
  end

  def show
    @items = Item.find(params[:id])
  end

end