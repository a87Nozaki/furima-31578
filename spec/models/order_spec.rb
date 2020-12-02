require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入内容の保存' do
    before do
      @order = FactoryBot.build(:order)
    end

    it '全ての値が正しく入力されてれば保存できる' do
      expect(@order).to be_valid
    end
    it '登録済のuserじゃないと保存できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it '出品された商品でないと保存できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空だと保存できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空だと登録できない' do
      @order.postcode = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeにハイフンが入ってないと登録できない' do
      @order.postcode  = 1231234
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode はハイフンを入れてください")
    end
    it 'prefecture_idが1の場合登録できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture を入力してください")
    end
    it 'prefecture_idが空の場合登録できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture を入力してください")
    end
    it 'cityが空だと保存できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できない' do
      @order.block = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block can't be blank")
    end
    it 'phoneが空だと登録できない' do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが12桁以上だと登録できない' do
      @order.phone = 000000000000
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone は11桁以内で入力してください")
    end
    it 'phoneにハイフンが入ってれば登録できない' do
      @order.phone = 000-0000-0000
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone は11桁以内で入力してください")
    end
  end
end
