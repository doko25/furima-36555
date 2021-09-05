class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path #パスを入れるの忘れない
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :deliver_price_id, :area_id, :days_id, :price, :user, :image).merge(user_id: current_user.id)
  end

end