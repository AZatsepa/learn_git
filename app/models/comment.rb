class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :by_post_and_user, -> (post_id, user_id) { where(post_id: post_id, user_id: user_id) }
end
