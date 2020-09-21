require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入に関する情報の保存' do
    context '情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名の記入がなくても保存できる' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
    end
    context '情報が保存できない場合' do
      it 'クレジットカード情報がないと保存できない' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと保存できない' do
        @purchase_address.postalCode = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号は半角数字でハイフンが含まれていないと保存できない' do
        @purchase_address.postalCode = "１２３４５６７"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid")
      end
      it '都道府県の選択がないと保存できない' do
        @purchase_address.state_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("State Select")
      end
      it '市区町村の記入がないと保存できない' do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の記入がないと保存できない' do
        @purchase_address.block_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号がないと保存できない' do
        @purchase_address.phoneNumber = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号は半角数字のみ11桁以内で記入されていないと保存できない' do
        @purchase_address.phoneNumber = "１２３４５６５"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phonenumber is invalid")
      end
    end
  end
end
