FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { 'abc123'}
    first_name { '山田' }
    last_name { '陸太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'リクタロ' }
    birthday { '1999-11-20' }
  end
end