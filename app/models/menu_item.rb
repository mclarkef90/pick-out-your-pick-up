class MenuItem < ApplicationRecord
  belongs_to :menu
  has_many :menu_item_reviews
  has_many :users, through: :menu_item_reviews
  validates :name, :description, presence: true
  validates :price, :presence => true, :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/ }

end
