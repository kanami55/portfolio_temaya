FactoryBot.define do
  factory :post_comment do
    comment { 'text' }
    association :post # アソシエーション
    user { post.user }
  end
end
