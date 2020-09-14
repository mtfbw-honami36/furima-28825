require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test_image.JPG')
  end

  describe '商品を出品する' do
    context '出品がうまくいくとき' do
      it '全てのフォームが記入されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がなければ出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリについての情報がなければ登録できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre Select')
      end

      it '商品の状態についての情報がなければ登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition Select')
      end

      it '配送料の負担についての情報がなければ登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost Select')
      end

      it '発送元の地域についての情報がなければ登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from Select')
      end

      it '発送までの日数についての情報がなければ登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end

      it '価格が入力されていなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300以上でなければ登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格が¥9,999,999以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格は半角数字でなければ登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
