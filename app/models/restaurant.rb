class Restaurant < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :restaurant_reviews
  has_many :menus, dependent: :destroy
  has_many :menu_items, through: :menus
  has_many :users, through: :restaurant_reviews
  validates :name, :address_one, :city, :state, presence: true
  validates_length_of :zipcode, minimum: 5, too_short: 'please enter at least 5 characters'

end
