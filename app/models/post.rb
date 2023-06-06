class Post < ApplicationRecord

  belongs_to :user

  validates  :title,      presence: true
  validates  :detail,     presence: true
  validates  :image,      presence: true

end
