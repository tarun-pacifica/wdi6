class ItemsController < ApplicationController
  def index
    @items = Item.where(name: params[:search])
  end
end