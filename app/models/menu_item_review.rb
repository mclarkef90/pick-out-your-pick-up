class MenuItemReview < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true
end
