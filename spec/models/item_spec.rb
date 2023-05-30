require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の投稿' do
    context '出品投稿ができる場合' do
      it '商品画像と商品名と商品説明、カテゴリーと商品の状態、配送料の負担と配送元の地域や発送までの日数、価格が存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '出品投稿ができない場合' do
      it '商品画像が空では登録できない' do
        @item.image = ''
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item can't be blank"
      end
      it '商品説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーが---では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '商品の状態が---では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end
      it '配送料の負担が---では登録できない' do
        @item.delivery_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end
      it '配送元の地域が空では登録できない' do
        @item.address_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Address prefecture can't be blank"
      end
      it '配送料の負担が---では登録できない' do
        @item.address_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Address prefecture can't be blank"
      end
      it '配送までの日数が空では登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
      it '配送までの日数が---では登録できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が299円以下であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
    end
  end
end
