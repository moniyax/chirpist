class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  validates :moniker, presence: true, uniqueness: true
  validates :fullname, presence: true

  def avatar_url size
    logger.debug('AV KEY -> ' + avatar_key) if avatar_key
    if avatar_key.blank?
      logger.debug('AV KEY is blank -> ' + moniker)

      # using avatar_key instead of self.avatar_key sets avatar_key to nil for
      # users whose avatar_key.blank? == false.
      # Dunno why.
      self.avatar_key = 'egg.png'
    end
    pic = "#{ENV['S3_REDIRECT_ENDPOINT']}/#{size}x#{size}/#{avatar_key}"
    logger.debug('PIC -> ' + pic)
    pic
  end
end
