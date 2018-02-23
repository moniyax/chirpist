class Post < ApplicationRecord
  has_many :likes
  has_many :reposts
  belongs_to :user

  def liked_by_user?(user)
    likes.find_by(user_id: user.id)
  end

  def reposted_by_user?(user)
    reposts.find_by(user_id: user.id)
  end
end
