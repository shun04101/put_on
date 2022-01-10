class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  has_many :posts, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  
  
  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約
  def active_for_authentication?
    ## is_deletedがfalseならtrueを返すようにしている
    super && (is_deleted == false)
  end

  # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end

  # 会員カナフルネーム
  def kana_full_name
    self.last_name_kana + " " + self.first_name_kana
  end
end
