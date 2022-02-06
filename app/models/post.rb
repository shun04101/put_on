class Post < ApplicationRecord
  
  belongs_to :user
  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
  attachment :image
  
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  
  # postモデルに仮想的にtag_nameカラムを作っている
  attr_accessor :tag_name
  
  # 新規にデータベースが作られたときに呼び出されるメソット
  after_create do
    if tag_name.present?
      save_tag(tag_name.split(','))
    end
  end
  
  after_update do
    if tag_name.present?
      update_tag(tag_name.split(','))
    end
  end
  
  def tag_name_presense
    pp "tag_name" + tag_name
    if tag_name.blank?
      errors.add(:tag_name, 'を入力して下さい')
    end
  end

  has_many :sites, dependent: :destroy
  accepts_nested_attributes_for :sites, allow_destroy: true
  # validates_associated :sites
  
  has_many :bookmarks, dependent: :destroy
  
  validates :title, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  # validates :tag, presence: true
  validate :tag_name_presense

  def save_tag(tag_names)
    # 新しいタグを保存
    tag_names.each do |tag_name|
      new_post_tag = Tag.find_or_create_by(tag_name: tag_name)
      self.tags << new_post_tag
    end
  end

  def update_tag(tag_names)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tag_names
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tag_names - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    save_tag(new_tags)
    
    # ６７行目の別解
    # new_tags.each do |new|
    #   new_post_tag = Tag.find_or_create_by(tag_name: new)
    #   self.tags << new_post_tag
    # end
  end
  
  def self.search(search, word)
    if search == "perfect_match"
    where(title: "#{word}")
    elsif search == "partial_match"
      where("title LIKE?","%#{word}%")
    else
      all
    end
  end

  # ７８行目〜８４行目までの別解
  # if search == "perfect_match"
  #   @post = Post.where(title: "#{word}")
  # elsif search == "partial_match"
  #   @post = Post.where("title LIKE?","%#{word}%")
  # else
  #   @post = Post.all
  # end

  # 既にブックマークしていないか検証
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
end
