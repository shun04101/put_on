class Site < ApplicationRecord
  
  belongs_to :post
  
  validates :link, presence: true
  validates :info, presence: true
  
  enum info: { tops: 0, bottoms: 1, accessory: 2, other: 3 }
end
