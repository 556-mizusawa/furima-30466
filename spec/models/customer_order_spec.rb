require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  describe "オーダー情報の保存" do
    before do
      @customer_order = FactoryBot.build(:customer_order)
    end
    #正常系
    it "必要事項が全て記入されていれば購入できる" do
      expect(@customer_order).to be_valid
    end

    it "建物名が抜けていても購入できる" do
      @customer_order.building_name = nil
      expect(@customer_order).to be_valid
    end

    #異常系
    it "カード情報が空だと購入できない" do
      @customer_order.token = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空だと購入できない" do
      @customer_order.postal_code = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号が全角数字だと購入できない" do
      @customer_order.postal_code = "１２３４５６７"
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Postal code is invalid")
    end

    it "郵便番号の-が抜けていると購入できない" do
      @customer_order.postal_code = "1234567"
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県が---だと購入できない" do
      @customer_order.prefecture_id = "---"
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Prefecture Select")
    end

    it "市区町村が空だと購入できない" do
      @customer_order.city = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空だと購入できない" do
      @customer_order.house_number = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("House number can't be blank")
    end

    it "電話番号が空だと購入できない" do
      @customer_order.tell_number = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Tell number can't be blank")
    end

    it "電話番号が全角数字だと購入できない" do
      @customer_order.tell_number = "０９０１２３４５６７８"
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Tell number is invalid")
    end
  end
end
