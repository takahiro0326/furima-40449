# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      expect(@user).to_not be_valid
    end

    it 'メールアドレスが必須であること' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'メールアドレスが一意性であること' do
      @user.email = "test@example.com"
      expect(@user).to_not be_valid
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = "invalidemail.com"
      expect(@user).to_not be_valid
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = "pass"
      expect(@user).to_not be_valid
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = "password"
      expect(@user).to_not be_valid
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = "password123"
      expect(@user).to_not be_valid
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.family_name = nil
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = "Smith"
      @user.first_name = "John"
      expect(@user).to_not be_valid
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.family_name_kana = nil
      @user.first_name_kana = nil
      expect(@user).to_not be_valid
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana = "スミス"
      @user.first_name_kana = "ジョン"
      expect(@user).to_not be_valid
    end

    it '生年月日が必須であること' do
      @user.birth_day = nil
      expect(@user).to_not be_valid
    end
  end
end