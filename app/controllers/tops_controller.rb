class TopsController < ApplicationController
  def index
    @products = Product.all # すべての商品を取得する例
  end
end