require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、familynameとfirstname、familyname_furiganaとfirstname_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数混合であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'familynameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.familyname = 'やマ田'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.firstname = 'りくタ郎'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'familyname_furiganaが全角（カタカナ）であれば登録できる' do
        @user.familyname_furigana = 'ヤマダ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'firstname_furiganaが全角（カタカナ）であれば登録できる' do
        @user.firstname_furigana = 'リクタロウ'
        @user.valid?
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
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'familynameが空では登録できない' do
        @user.familyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'familyname_furiganaが空では登録できない' do
        @user.familyname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname furigana can't be blank")
      end
      it 'firstname_furiganaが空では登録できない' do
        @user.firstname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname furigana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'familynameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.familyname = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname Full-width characters')
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.firstname = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname Full-width characters')
      end
      it 'familyname_furiganaが全角（カタカナ）でないと登録できない' do
        @user.familyname_furigana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname furigana Full-width katakana characters')
      end
      it 'firstname_furiganaが全角（カタカナ）でないと登録できない' do
        @user.firstname_furigana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname furigana Full-width katakana characters')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
