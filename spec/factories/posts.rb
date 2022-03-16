FactoryBot.define do #データ定義
  factory :post do    #どのモデルに対してデータ定義を行るか
    title { Faker::Lorem.characters }
    production_period { Faker::Lorem.characters }
    cost { Faker::Lorem.characters }
    explanation  { Faker::Lorem.characters }
    difficulty { Faker::Lorem.characters }
    association :user
  end
end