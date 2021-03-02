require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
      it '@itemが全て入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do

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

     it 'status_idが0だと登録できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include( "Status must be other than 0")
     end

     it 'category_idが0だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include( "Category must be other than 0")
     end

     it 'shipping_cost_idが0だと登録できない' do
      @item.shipping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include( "Shipping cost must be other than 0")
     end

     it 'shipping_day_idが0だと登録できない' do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include( "Shipping day must be other than 0")
     end

     it 'prefecture_idが0だと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include( "Prefecture must be other than 0")
     end

     it 'priceは299円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is invalid")
     end

     it 'priceは10,000,000円以上だと登録できない' do
      @item.price = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is invalid")
     end

     it 'priceは全角英字だと登録できない' do
      @item.price = 'A'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is invalid")
     end

     it 'priceは英数混同だとだと登録できない' do
      @item.price = '1a'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is invalid")
     end

     it 'priceは半角英数のみだと登録できない' do
      @item.price = 'a'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is invalid")
     end
    
    end
    
  end
end
