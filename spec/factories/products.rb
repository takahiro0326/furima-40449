FactoryBot.define do
  factory :product do
    association :user

    product_name { '・ギター' }
    description_item { 'これはテスト用のアイテムです。→ギター' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/ダウンロード.jpeg'), filename: 'test_image.png')
    end
  end
end