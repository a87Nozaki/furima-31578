require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it 'image, name, explain, category_id, status_id, burden_id, prefeture_id, day_id, price, user_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explainが空だと登録できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが1の場合保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが1の場合登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'burden_idが1の場合登録できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'prefecture_idが1の場合登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'day_idが1の場合登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 9,999,999以下で入力してください")
      end
      it 'priceの値が9,999,999以上だと登録できない' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 9,999,999以下で入力してください")
      end
      it 'priceの値が300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 9,999,999以下で入力してください")
      end
      it 'priceは半角数字でないと保存できない' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 9,999,999以下で入力してください")
      end
    end
  end
end
