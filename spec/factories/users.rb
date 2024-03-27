FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "#{Faker::Internet.password(min_length: 8, mix_case: true, special_characters: false)}1a" }
    password_confirmation { password }
    nickname { Faker::Internet.username }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end