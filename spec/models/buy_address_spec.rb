require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'numberarea_id,town,banchi,phone,tokenが存在すれば購入できる ' do
        expect(@address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        expect(@address).to be_valid
      end
    end

    context '購入できない時' do
      it '郵便番号が存在しない' do
        @address.number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Number can't be blank")
      end

      it '郵便番号にハイフンが無い' do
        @address.number = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Number is invalid. Include hyphen(-)")
      end

      it '都道府県が無い' do
        @address.area_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end

      it '市町村が無い' do
        @address.town = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Town can't be blank")
      end

      it '番地が無い' do
        @address.banchi = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Banchi can't be blank")
      end

      it '電話番号が無い' do
        @address.phone = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が10桁以上11桁以内で半角数値ではない' do
        @address.phone = '090-1111-1111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone is invalid")
      end

      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

