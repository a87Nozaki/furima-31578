class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'は英字と数字の両方を含めて設定してください' }

  with_options presence: true, format:  { with: /\A[ぁ-ん ァ-ン 一-龥]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください'} do
    validates :first_name_kana
    validates :last_name_kana
  end
end
