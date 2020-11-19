FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { 'abc123'}
    first_name { '野﨑' }
    last_name { '勇希' }
    first_name_kana { 'ノザキ' }
    last_name_kana { 'ユウキ' }
    birthday { '1989-8-27' }
  end
end