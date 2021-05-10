class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :likes, :foreign_key => "user_id", :class_name => "Likes"

  has_many :likees, :through => :likes
  has_one_attached :image
end
