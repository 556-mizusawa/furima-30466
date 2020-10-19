FactoryBot.define do
  factory :item do
    image             { Faker::Lorem.sentence }
    title             { "タイトル" }
    catch_copy        { "説明文" }
    genre_id            { 1 }
    status_id            { 1 }
    delivery_fee_id      { 1 }
    prefecture_id        { 1 }
    day_id               { 1 }
    price             { 3000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
