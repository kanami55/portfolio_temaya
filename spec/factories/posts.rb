#テスト用のダミーデータを用意してくれるGem
#Faker::Fakerを使用する宣言
#Lorem:ダミーテキストタイプを選択
#characters:文字列を作成
#number:生成文字数の指定

FactoryBot.define do #データ定義
  factory :post do    #どのモデルに対してデータ定義を行るか
    title {Faker::Lorem.characters(number:5)}
    production_period {Faker::Lorem.characters(number:8)}
    cost {Faker::Lorem.characters(number:5)}
    difficulty {Faker::Lorem.characters(number:5)}
    explanation {Faker::Lorem.characters(number:20)}
  end
end
