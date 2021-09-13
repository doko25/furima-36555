class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, except: :create

  def index
    @buy_address = BuyAddress.new
    @item=Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item=Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:number,:area_id, :town, :banchi, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token:  params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @buy = Buy.find(params[:item_id])
    if @buy.valid?
      redirect_to root_path
    end
  end


end
