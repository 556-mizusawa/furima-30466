require 'rails_helper'

RSpec.describe Item, type: :model do
  before "#create" do
    @item = FactoryBot.build(:item)
  end

  context "商品出品ができる場合" do
    it "必要事項が全て記入されていれば出品ができる" do
      expect(@item).to be_valid
    end
  end

#==================================================================================
  context "商品出品ができない場合" do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空だと登録できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it "商品説明が空だと登録できない" do
      @item.catch_copy = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Catch copy can't be blank")
    end

    it "カテゴリー選択が---だと登録できない" do
      @item.genre_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre Select")
    end

    it "商品状態選択が---だと登録できない" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it "配送料選択が---だと登録できない" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")
    end

    it "発送元選択が---だと登録できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "発送日数選択が---だと登録できない" do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day Select")
    end

    it "金額が300円未満だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    
    it "金額が10,000,000円以上だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
