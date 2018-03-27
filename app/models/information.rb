class Information < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { in: 1..200 }
  validates :destination, presence: true, length: { maximum: 200 }
  validates :release, presence: true, length: { in: 1..1 }, :numericality => { :less_than_or_equal_to => 1 } 

end
