require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していると登録できない' do
        anotheruser = FactoryBot.create(:user)
        @user.email = anotheruser.email
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'paswo'
        @user.password_confirmation = 'paswo'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdffg'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください。'
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください。')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'passワード1234'
        @user.password_confirmation = 'passワード1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください。')
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角文字で入力してください。')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字で入力してください。')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角カタカナで入力してください。')
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'たろう '
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください。')
      end
      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'pasword2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameが空では登録できない' do
        @user = FactoryBot.build(:user)
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end