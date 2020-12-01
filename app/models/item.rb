class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image, :name, :explain
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :status_id, :burden_id, :prefecture_id, :day_id
  end

  validates :price, numericality: {
    only_integer: true, message: '半角数字を使用してください',
    greater_than_or_equal_to: 300, message: '300以上で入力してください',
    less_than_or_equal_to: 9999999, message: '9,999,999以下で入力してください'
  }
end
