class RestaurantReview < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true
  scope :newest, -> { order(created_at: :desc) }

  def self.last_three
    all.order(created_at: :desc).limit(3)
  end

  def self.top_three
    all.group(:restaurant_id).average(:rating).first(3)
  end
end
