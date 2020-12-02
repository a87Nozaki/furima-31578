class Order 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone, :token

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, purchase_id: purchase.id)
  end

  with_options presence: true do
    validates :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :phone, :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください'}
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを入れてください'}
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'は11桁以内で入力してください'}
end
