FactoryBot.define do
  factory :order do
    user_id { 1 }
    item_id { 1 }
    token { "tok_abcdefghijk00000000000000000" }
    postcode { "123-4567" }
    prefecture_id { 2 }
    city { "〇〇市" }
    block { "〇〇町" }
    phone { "09012345678" }
    # association :user
    # association :item
  end
end
