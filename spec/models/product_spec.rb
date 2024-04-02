require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user: @user)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '必要な情報が全て存在していれば保存できる' do
        expect(@product).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it '商品画像がないと保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品名が40文字を超えると保存できない' do
        @product.product_name = 'a' * 41
        @product.valid?
        expect(@product.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
      end

      it '商品説明がないと保存できない' do
        @product.description_item = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description item can't be blank")
      end

      it '商品説明が1000文字を超えると保存できない' do
        @product.description_item = 'a' * 1111
        @product.valid?
        expect(@product.errors.full_messages).to include('Description item is too long (maximum is 1000 characters)')
      end

      it 'カテゴリーIDがないと保存できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態のIDがないと保存できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料負担のIDがないと保存できない' do
        @product.shipping_charge_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '発送元地域のIDがないと保存できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送日数のIDがないと保存できない' do
        @product.shipping_date_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it '価格がないと保存できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満では保存できない' do
        @product.price = 222
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999より大きいと保存できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数値以外だと保存できない' do
        @product.price = '１１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end