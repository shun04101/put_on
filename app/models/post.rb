class Post < ApplicationRecord
  
  belongs_to :user
  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
  attachment :image
  
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  
  validates :title, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  # validates :tag, presence: true
  validates :site, presence: true


end
