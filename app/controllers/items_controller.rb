class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show, :new, :create, :update]
  before_action :set_item, except: [:index, :show, :new, :create, :update, :destroy]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :deliver_price_id, :area_id, :days_id, :price, :user, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item=Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    if @item.buy.present?
      redirect_to root_path
    end
  end

end