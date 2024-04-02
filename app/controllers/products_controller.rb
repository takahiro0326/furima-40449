class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :check_user, only: [:edit, :update, :destroy]
  #before_action :check_soldout, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description_item, :price, :image, :category_id, :condition_id, :shipping_charge_id,:prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  #def set_product
    #@product = Product.find(params[:id])
  #end

  #def check_user
    #redirect_to root_path unless current_user == @product.user
  #end

  #def check_soldout
    #redirect_to root_path if @product.purchase_history.present?
  #end
#end
end