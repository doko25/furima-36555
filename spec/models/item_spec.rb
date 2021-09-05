require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー新規登録' do
    context '出品できるとき' do
      it 'image,name, detail,category_id,condition_id,deliver_price_id,area_id, days_id,priceが存在すれば出品できる' do
      end

      it 'priceが300~9999999であれば出品できる' do
      end
    end

    context '出品できない時' do
      it 'imageが空だと出品できない' do
      end

      it 'nameが空だと出品できない' do
      end

      it 'detailが空だと出品できない' do
      end

      it 'category_idが「--」であれば出品できない' do
      end

      it 'condition_idが「--」であれば出品できない' do
      end

      it 'deliver_price_idが「--」であれば出品できない' do
      end

      it 'area_idが「--」であれば出品できない' do
      end

      it 'days_idが「--」であれば出品できない' do
      end

      it 'priceが空だと出品できない' do
      end

      it 'priceが300以下だと出品できない' do
      end

      it 'priceが9999999以上だと出品できない' do
      end
    end
  end
end
