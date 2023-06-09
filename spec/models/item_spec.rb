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
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it '商品名が空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end
      it 'カテゴリーが---では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリー can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it '商品の状態が---では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態 can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it '配送料の負担が---では登録できない' do
        @item.delivery_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担 can't be blank"
      end
      it '配送元の地域が空では登録できない' do
        @item.address_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を入力してください"
      end
      it '配送元の地域が---では登録できない' do
        @item.address_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域 can't be blank"
      end
      it '配送までの日数が空では登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end
      it '配送までの日数が---では登録できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数 can't be blank"
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it '販売価格が299円以下であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
      end
      it '価格が10000000円以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
      end
      it '価格が半角数字以外の値を含んでいる場合は登録できない' do
        @item.price = '１000'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end
      it 'ユーザーと紐づいていないと保存できないこと' do
        item = FactoryBot.build(:item, user: nil)
        item.valid?
        expect(item.errors[:user]).to include("を入力してください")
      end
    end
  end
end
