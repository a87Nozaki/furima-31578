class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname presence: true
  validates :email, uniquess: true
  validates :passward, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'は英字と数字の両方を含めて設定してください' }
  validates :first_name presence: true, format: { with: /\A[ぁ-ん ァ-ン 一-龥]+\z/, messa: 'は全角文字を使用してください' }
  validates :last_name presence: true, format: { with: /\A[ぁ-ん ァ-ン 一-龥]+\z/, messa: 'は全角文字を使用してください' }
  validates :first_name_kana presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください'}
  validates :last_name_kana presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください'}
  validates :birthday presence: true
end
