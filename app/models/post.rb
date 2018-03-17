class Post < ApplicationRecord
  validates :content, length: { in: 1..400 }

  belongs_to :user
    
  mount_uploader :image, ImageUploader
end
