class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :prefecture_id, :ship_form_area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
