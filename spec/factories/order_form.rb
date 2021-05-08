FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { "123-4567" }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Gimei.address.city.kanji }
    address { Gimei.address.town.kanji }
    phone_number { 12345678910 }
    building_name { Gimei.last.kanji + "ビル" } 
  end
end
