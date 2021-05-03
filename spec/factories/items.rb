FactoryBot.define do
  factory :item do
    title { Faker::Internet.username(specifier: 40) }
    description { Faker::Lorem.sentence(word_count: 1000) }
    category_id { Faker::Number.within(range: 2..11) }
    condition_id { Faker::Number.within(range: 2..7) }
    days_to_ship_id { Faker::Number.within(range: 2..4) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    ship_form_area_id { Faker::Number.within(range: 2..3) }
    price { Faker::Number.within(range: 300..9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
