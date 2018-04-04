class Information < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { in: 1..255 }

end
