require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
       @user.email = 'testmail'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
       end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a23456'
        @user.password_confirmation = 'aa34567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '223456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ23456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'last_nameが空では登録が出来ない' do
        @user.last_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録が出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空では登録が出来ない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'last_name_kanaにひらがな文字が含まれていると登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空では登録が出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'first_name_kanaにひらがな文字が含まれていると登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空では登録が出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end