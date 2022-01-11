class PostTag < ApplicationRecord
  
  belongs_to :post
  belongs_to :tag
  
  validates :post_id, presence: true
  validates :tag_id, presence:true
  
  
  def self.search(search, word)
    if search == "perfect_match"
      @post_tag = PostTag.where(tag_name: "#{word}")
    elsif search == "partial_match"
      @post_tag = PostTag.where("tag_name LIKE?","%#{word}%")
    else
      @post_tag = PostTag.all
    end
  end
end