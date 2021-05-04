require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '出品登録できるとき' do
      it 'image、titleとdescription、category_idとcondition_idとprefecture_idとship_form_area_idとdays_to_ship_id、price、userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'Priceが¥300~¥9,999,999の間であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'Priceが半角数字であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'category_idが1~11の中で1以外であれば登録できる' do
        @item.category_id = 11
        expect(@item).to be_valid
      end
      it 'condition_idが1~7の中で1以外であれば登録できる' do
        @item.condition_id = 7
        expect(@item).to be_valid
      end
      it 'days_to_ship_idが1~4の中で1以外であれば登録できる' do
        @item.days_to_ship_id = 4
        expect(@item).to be_valid
      end
      it 'prefecture_idが1~48の中で1以外であれば登録できる' do
        @item.prefecture_id = 48
        expect(@item).to be_valid
      end
      it 'ship_form_area_idが1~3の中で1以外であれば登録できる' do
        @item.ship_form_area_id = 3
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'ship_form_area_idが空では登録できない' do
        @item.ship_form_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form area can't be blank")
      end
      it 'days_to_ship_idが空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'Priceが¥299以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'Priceが¥10,000,000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'Priceが半角数字でないと登録できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'Priceが半角英数混合では登録できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'Priceが半角英語だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'ship_form_area_idが1だと登録できない' do
        @item.ship_form_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship form area Select')
      end
    end
  end
end
