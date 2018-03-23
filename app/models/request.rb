class Request < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
          format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :content, presence: true
  validates :content, length: { in: 1..200 }
      
  before_save { email.downcase! }

  belongs_to :user
end
