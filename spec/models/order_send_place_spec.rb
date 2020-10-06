require 'rails_helper'

RSpec.describe OrderSendPlace, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_send_place, item_id: @item.id, user_id: @user.id)
  end

  describe '商品購入' do
    context "商品購入ができる場合" do
      it "全て入力できていれば購入できる" do
        expect(@order).to be_valid
      end
    end
    context "商品購入ができない場合" do
      it "正しいクレジットカード情報が入力できてない(トークンが空だ)と購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が入力されていないと購入できない" do
        @order.postalcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postalcode can't be blank")
      end
      it "郵便番号にハイフン(-)が無いと購入できない" do
        @order.postalcode = 12345678910
        @order.valid?
        expect(@order.errors.full_messages).to include("Postalcode is invalid")
      end
      it "都道府県が選択されていないと購入できない" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it "市町村区が入力されていないと購入できない" do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が入力されていないと購入できない" do
        @order.homeadress = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Homeadress can't be blank")
      end
      it "電話番号が入力されていないと購入できない" do
        @order.phonenumber = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it "電話番号が12桁以上だと購入できない" do
        @order.phonenumber = 123456789101
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "電話番号が数値でない時は購入できない" do
        @order.phonenumber = 'ゼロハチゼロ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "電話番号にハイフン(-)が入力されていると購入できない" do
        @order.phonenumber = 111-111-111
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber is invalid")
      end
    end
  end
end
