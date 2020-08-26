class Production < ApplicationRecord

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :size, presence: true
  validates :shipping_charge, presence: true
  validates :prefecture_code, presence: true
  validates :detail_date, presence: true
  validates :trading_status, presence: true
  validates :category_id, presence: true
  validates :images, length: {minimum: 1, maximum: 5, message: '画像を選択してください' }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  

end
  
