class Genre < ApplicationRecord
  has_many :restaurants
  validates :name, presence: true
  scope :alpha, -> { order(:name) }
end
