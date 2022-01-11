class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿をもつ。それは、post_tagsを通じて参照する(through)
  has_many :posts, through: :post_tags
  
  validates :tag_name, uniqueness: true, presence: true
  
  def self.search(search, word)
    if search == "perfect_match"
      @tags = Tag.where(tag_name: "#{word}")
    elsif search == "partial_match"
      @tags = Tag.where("tag_name LIKE?","%#{word}%")
    else
      @tags = Tag.all
    end
    @tags
  end
end
