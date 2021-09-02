require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'emailとpasswordとpassword_confirmationとnicknameとname_lastとname_firstとname_kana_lastとname_kana_firstとbirthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが６文字以上であれば登録できる'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない'
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'name_lastが空では登録できない'
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_last can't be blank")
      end
      it 'name_firstが空では登録できない'
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_first can't be blank")
      end
      it 'name_kana_lastが空では登録できない'
      @user.name_kana_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_kana_last can't be blank")
      end
      it 'name_kana_firstが空では登録できない'
      @user.name_kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name_kana_first can't be blank")
      end
      it 'birthが空では登録できない'
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1111'
        @user.password_confirmation = 'a1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
