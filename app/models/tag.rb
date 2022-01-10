class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿をもつ。それは、post_tagsを通じて参照する(through)
  has_many :posts, through: :post_tags
  
  validates :tag_name, uniqueness: true, presence: true
end
