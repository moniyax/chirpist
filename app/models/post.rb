class Post < ApplicationRecord
  has_many :likes
  belongs_to :user

  def liked_by_user?(user)
    likes.find_by(user_id: user.id)
  end
end
