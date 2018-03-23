class Post < ApplicationRecord
  validates :content,  presence: true, length: { in: 1..400 }
  validates :release,  presence: true, length: { in: 1..1 }

  belongs_to :user
    
  mount_uploader :image, ImageUploader
end
