class Restaurant < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :restaurant_reviews
  has_many :menus, dependent: :destroy
  has_many :menu_items, through: :menus
  has_many :users, through: :restaurant_reviews
  validates :name, :address_one, :city, :state, presence: true
  validates_length_of :zipcode, minimum: 5, too_short: 'please enter at least 5 characters'
  scope :alpha, -> { order(:name) }

  def self.genrefilter(params)
        where("genre_id = ?", params)
      end

    def self.search(params)
      where("LOWER(restaurants.name) LIKE :term OR LOWER(restaurants.city) LIKE :term OR LOWER(restaurants.state) LIKE :term OR LOWER(restaurants.zipcode) LIKE :term", term: "%#{params}%")
    end

    
end
