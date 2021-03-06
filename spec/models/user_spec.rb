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
      it 'passwordとpassword_confirmationが６文字以上であれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ11111'
        @user.password_confirmation = 'あ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが空では登録できない' do
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
      it 'name_lastが空では登録できない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.name_last = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last is invalid. Input full-width characters.")
      end
      it 'name_firstが空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.name_first = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first is invalid. Input full-width characters.")
      end
      it 'name_kana_lastが空では登録できない' do
        @user.name_kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana last can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.name_kana_last = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana last is invalid. Input full-width katakana characters.")
      end
      it 'name_kana_firstが空では登録できない' do
        @user.name_kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana first can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.name_kana_first = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana first is invalid. Input full-width katakana characters.")
      end
      it 'birthが空では登録できない' do
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
end
