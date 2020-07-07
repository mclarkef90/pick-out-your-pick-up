class Cart < ApplicationRecord
  belongs_to :user
  has_many :take_out_orders
  accepts_nested_attributes_for :take_out_orders
  has_many :menu_items, through: :take_out_orders
end
