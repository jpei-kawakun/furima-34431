require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nick_nameが空だと登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは、5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは、半角英数字混合での入力が必須' do
      @user.password = '1111111'
      @user.password_confirmation = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須' do
      @user.family_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
      @user.family_name = '1aA'
      @user.first_name = '1aA'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid', 'First name is invalid')
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須' do
      @user.family_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid", "First name kana is invalid")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須' do
      @user.family_name_kana = '1aAあ阿'
      @user.first_name_kana = '1aAあ阿'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid", "First name kana is invalid")
    end
    it '生年月日が必須' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'passwordは英語のみでは登録できないこと' do
      @user.password = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは全角では登録できないこと' do
      @user.password = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  end
end
