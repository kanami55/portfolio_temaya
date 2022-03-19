FactoryBot.define do
  factory :user, aliases: [:follower, :followed] do
    name { Faker::name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
