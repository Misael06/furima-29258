require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の投稿' do
    context "出品ができる場合" do
      it "画像、名前、説明文、値段、カテゴリー、商品状態、手数料、送付先、必要日数があれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "ツイートが保存できない場合" do
      it "画像が無いと商品を出品できない" do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end     
      it "名前が無いと商品を出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明文が無いと商品を出品できない" do
        @item.explanatory = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory can't be blank")
      end
      it "値段が入力されていないと商品を出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "値段が300円未満だと商品を出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "値段が10000000以上だと商品を出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "カテゴリーが選択されていないと商品を出品できない" do
        @item.category = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品状態が選択されていないと商品を出品できない" do
        @item.status = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "手数料が選択されていないと商品を出品できない" do
        @item.fee = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee Select")
      end
      it "送付先が選択されていないと商品を出品できない" do
        @item.shipmentsource = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipmentsource Select")
      end
      it "必要日数が選択されていないと商品を出品できない" do
        @item.timerequired = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Timerequired Select")
      end
    end
  end
end
