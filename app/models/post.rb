class Post < ApplicationRecord
  
  belongs_to :user
  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
  attachment :image
  
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  
  has_many :sites, dependent: :destroy
  accepts_nested_attributes_for :sites, allow_destroy: true
  validates_associated :sites
  
  validates :title, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  # validates :tag, presence: true

  def save_tag(sent_tags)
    # 新しいタグを保存
    sent_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def update_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete = Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end
  
  def self.search(search, word)
    if search == "perfect_match"
      @post = Post.where(title: "#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
