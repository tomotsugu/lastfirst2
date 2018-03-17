class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :manager,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
  validates :prefecture,  presence: true, length: { maximum: 14 }
  validates :city,  presence: true, length: { maximum: 20 }
  validates :municipality,  presence: true, length: { maximum: 50 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :role,  presence: true

  has_many :contacts, dependent: :destroy

end
