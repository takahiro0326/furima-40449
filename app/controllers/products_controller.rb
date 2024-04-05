class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

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

  def edit
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path, alert: '他のユーザーの商品情報を編集することはできません。'
    end
  end

  def update
    @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to product_path(@product), notice: '商品情報が更新されました。'
  else
    render :edit, status: :unprocessable_entity
  end
end

  private

  def product_params
    params.require(:product).permit(:product_name, :description_item, :price, :image, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end