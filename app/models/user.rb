class User < ApplicationRecord
  has_secure_password
  has_many :restaurants
  has_many :restaurant_reviews
  has_many :menu_item_reviews
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
