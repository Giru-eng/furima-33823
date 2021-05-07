require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  context '内容に問題ない場合' do
    it "token、postal_code、city、address、phone_number、user_id、item_idがあれば保存ができること" do
      expect(@order_form).to be_valid
    end
    it "postal_codeが前3桁後ろ４桁の半角数字で間にハイフン(-)があれば保存ができること" do
      @order_form.postal_code = '123-4567'
      expect(@order_form).to be_valid
    end
    it 'prefecture_idが1~48の中で1以外であれば登録できる' do
      @order_form.prefecture_id = 48
      expect(@order_form).to be_valid
    end
    it "phone_numberが10or11桁の半角数字であれば保存ができること" do
      @order_form.phone_number = 12345678910
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では保存ができないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空では登録できないこと" do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it "cityが空では登録できないこと" do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空では登録できないこと" do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空では登録できないこと" do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'prefecture_idが空では登録できない' do
      @order_form.prefecture_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'user_idが空では登録できない' do
      @order_form.user_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できない' do
      @order_form.item_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
    it "phone_numberが9以下の半角数字では登録できないこと" do
      @order_form.phone_number = 123456789
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number Input only 10 or 11 half-width numbers")
    end
    it "phone_numberが12以上の半角数字では登録できないこと" do
      @order_form.phone_number = 123456789123
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number Input only 10 or 11 half-width numbers")
    end
    it "phone_numberが10桁でも全角数字では登録できないこと" do
      @order_form.phone_number = '１２３４５６７８９１'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number Input only 10 or 11 half-width numbers")
    end
    it "postal codeの上部が3桁以外では登録できないこと" do
      @order_form.postal_code = '1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
    end
    it "postal codeの下部が4桁以外では登録できないこと" do
      @order_form.postal_code = '123-456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
    end
    it "postal codeが7桁であっても上部3桁の半角数字と下部４桁の半角数字の間にハイフン(-)がないと登録できないこと" do
      @order_form.postal_code = 1234567
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
    end
    it 'prefecture_idが1だと登録できない' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Prefecture Select')
    end
  end
end
