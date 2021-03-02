require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品出品機能' do
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字ではないと登録できない' do
      @item.price = 123
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it 'priceは300-99999999の間でないと登録できない' do
      @item.price = 300-99999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end

    it 'status_idが空だと登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'shipping_cost_idが空だと登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end

    it 'shipping_day_idが空だと登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it 'prefecture_idが空だと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Prefecture can't be blank")
    end
  end
end
