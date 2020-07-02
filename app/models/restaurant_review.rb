class RestaurantReview < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true
end
