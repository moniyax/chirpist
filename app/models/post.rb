class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :reposts
  has_many :mentions

  after_save :save_mentions

  AT_REGEX = Regexp.new('(@([\w.@_-]+))', Regexp::EXTENDED)

  def liked_by_user?(user)
    likes.find_by(user_id: user.id)
  end

  def reposted_by_user?(user)
    reposts.find_by(user_id: user.id)
  end

  def save_mentions
    mentions = text.scan(AT_REGEX)
    users = mentions.map{|m| User.find_by(moniker: m[1,m.length])}.compact
    users.map{|u| u.mentions.create(post: self)}
  end

end
