class Relationship < ApplicationRecord
  #アソシエーションの関係
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

end
