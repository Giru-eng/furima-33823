FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username(specifier: 40) }
    email { Faker::Internet.unique.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password { password }
    password_confirmation { password }
    familyname { Gimei.last.kanji }
    firstname { Gimei.first.kanji }
    familyname_furigana { Gimei.last.katakana }
    firstname_furigana { Gimei.first.katakana }
    birthday { Faker::Date.between(from: '1930-09-23', to: 5.year.from_now) }
  end
end
