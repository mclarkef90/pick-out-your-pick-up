class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_items, dependent: :destroy
  validates :details, :name, presence: true
end
