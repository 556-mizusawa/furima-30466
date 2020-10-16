class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    
  end

  private
  def prototype_params
    params.require(:items).permit(:title, :catch_copy, :genre_id, :status_id, :delivery_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end
