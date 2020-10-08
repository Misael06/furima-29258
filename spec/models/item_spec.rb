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
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end     
      it "名前が無いと商品を出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "説明文が無いと商品を出品できない" do
        @item.explanatory = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "値段が入力されていないと商品を出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "値段が半角でないと商品を出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください。")
      end
      it "値段が300円未満だと商品を出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300より大きい値にしてください")
      end
      it "値段が10000000以上だと商品を出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999より小さい値にしてください")
      end
      it "カテゴリーが選択されていないと商品を出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "商品状態が選択されていないと商品を出品できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "手数料が選択されていないと商品を出品できない" do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "送付先が選択されていないと商品を出品できない" do
        @item.shipmentsource_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送先地域を選択してください")
      end
      it "必要日数が選択されていないと商品を出品できない" do
        @item.timerequired_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
    end
  end
end
