class Notification < ApplicationRecord
  #スコープ(新着順)
  default_scope->{order(create_at: :desc)}

  belongs_to :post, optional: true
  belongs_to :post_comment, optional: true
  belongs_to :visiter, class_name: 'User', foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: 'User', foreign_key: "visited_id", optional: true

end
