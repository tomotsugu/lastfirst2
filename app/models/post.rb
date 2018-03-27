class Post < ApplicationRecord
  validates :content, presence: true, length: { in: 1..400 }
  validates :release, presence: true, length: { in: 1..1 }
  validates :release, presence: true, length: { in: 1..1 }, :numericality => { :less_than_or_equal_to => 1 } 

  belongs_to :user
    
  mount_uploader :image, ImageUploader
end
