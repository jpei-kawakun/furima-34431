require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入履歴の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品出品ができる時' do
     it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_destination).to be_valid
     end
     it 'building_nameは空でも保存できること' do
      @purchase_destination.building_name = ''
      expect(@purchase_destination).to be_valid
     end
    end

    context '商品出品ができない時' do
     it 'post_codeが空だと保存できないこと' do
      @purchase_destination.post_code = ''
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
     end
     it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_destination.post_code = '1234567'
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
     end
     it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_destination.prefecture_id = 0
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
     end
     it 'cityは空だと保存できないこと' do
      @purchase_destination.city = ''
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
     end
     it 'addressは空だと保存できないこと' do
      @purchase_destination.address = ''
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
     end
     it 'phone_numberが空だと保存できないこと' do
      @purchase_destination.phone_number = ''
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
     end
     it 'phone_numberは数字以外保存できないこと' do
      @purchase_destination.phone_number = 'aA'
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
     it 'phone_numberは11桁以内の数値のみ保存可能なこと' do
      @purchase_destination.phone_number = '111111111111'
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
     it 'phone_numberは全角数字だと保存できないこと' do
        @purchase_destination.phone_number = '１'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
     end
     it "tokenが空では登録できないこと" do
      @purchase_destination.token = nil
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @purchase_destination.user_id = nil
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @purchase_destination.item_id = nil
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
    end
    end
  end
end
