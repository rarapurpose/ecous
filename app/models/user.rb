class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true       
  validates :username, presence: true       
  
  has_many  :posts
  has_many  :comments
end