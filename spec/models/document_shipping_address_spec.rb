require 'rails_helper'

RSpec.describe DocumentShippingAddress, type: :model do
  describe '発送情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @documentshippingaddress = FactoryBot.build(:document_shipping_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@documentshippingaddress).to be_valid
      end
      it 'address_buildingは空でも保存できること' do
        @documentshippingaddress.address_building = ''
        expect(@documentshippingaddress).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'numberが空だと保存できないこと' do
        @documentshippingaddress.number = ''
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @documentshippingaddress.number = '11111111'
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'address_prefecture_idを1に選択した場合は保存できないこと' do
        @documentshippingaddress.address_prefecture_id = 1
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'address_cityが空だと保存できないこと' do
        @documentshippingaddress.address_city = ''
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'address_numberが空だと保存できないこと' do
        @documentshippingaddress.address_number = ''
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephoneが空だと保存できないこと' do
        @documentshippingaddress.telephone = ''
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telephoneが数字以外を含むと保存できないこと' do
        @documentshippingaddress.telephone = 'a'
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'telephoneが半角数字以外を含むと保存できないこと' do
        @documentshippingaddress.telephone = '０9012341234'
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'telephoneが9桁以下は保存できないこと' do
        @documentshippingaddress.telephone = 111111111
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'telephoneが12桁以下は保存できないこと' do
        @documentshippingaddress.telephone = 111111111111
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐付いていないと保存できないこと' do
        @documentshippingaddress.user_id = nil
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @documentshippingaddress.item_id = nil
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空だと保存できないこと' do
        @documentshippingaddress.token = nil
        @documentshippingaddress.valid?
        expect(@documentshippingaddress.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
   end
end