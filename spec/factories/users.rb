FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 1) }
    email                 { Faker::Internet.free_email }
    password              { "tech556" }
    password_confirmation { password }
    last_name             { "山田" }
    first_name            { "太郎"}
    last_name_reading     { "ヤマダ" }
    first_name_reading    { "タロウ" }
    birthday              { "1930-01-01" }
  end
end