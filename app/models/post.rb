class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates  :title,      presence: true
  validates  :detail,     presence: true
  validates  :image,      presence: true

  has_many :comments, dependent: :destroy
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end