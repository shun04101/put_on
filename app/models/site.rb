class Site < ApplicationRecord
  
  belongs_to :post
  
  validates :link, presence: true
  validates :info, presence: true
  
  enum info: { tops: 0, jacket: 1, pants: 2, skirt: 3, dress: 4, shoes: 5, goods: 6, accessory: 7, other: 8 }
end
