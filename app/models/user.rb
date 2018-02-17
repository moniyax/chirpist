class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :relationships
  has_many :followers, through: :relationships
  has_many :inverse_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followings, through: :inverse_relationships

  validates :moniker, presence: true, uniqueness: true
  validates :fullname, presence: true

  def avatar_url size
    if avatar_key.blank?

      # using avatar_key instead of self.avatar_key sets avatar_key to nil for
      # users whose avatar_key.blank? == false.
      # Dunno why.
      self.avatar_key = 'egg.png'
    end
    "#{ENV['S3_REDIRECT_ENDPOINT']}/#{size}x#{size}/#{avatar_key}"
  end

  def who_to_follow
    User.where.not(id: [id] + followings.pluck(:id)).last(6)
  end
end
