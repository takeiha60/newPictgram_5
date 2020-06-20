class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 15}
  
  validates :email, presence: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
  
  validates :password, presence: true, format:  { with: /(?=.{8,32})(?=.*\d+.*)(?=.*[a-zA-Z]+.*)/}
  # PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  # validates :password, presence: true, format: { with: PW_REGEX }
  
  has_secure_password
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end

#   has_many :topics
#   has_many :favorites
# end
