class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :ensure_correct_user, only: [:index, :create] 

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_correct_user
    redirect_to root_path if authenticate_user! && current_user.id == @item.user_id && @item.item_purchase.blank? || @item.item_purchase.present?
    return
    redirect_to root_path if authenticate_user! && @item.item_purchase.present?
    return
  end
end
