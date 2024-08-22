
class Product < ApplicationRecord
    has_one_attached :image
    has_many :line_items, dependent: :destroy
    has_many :orders, through: :line_items
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
  
    def average_rating
      ratings.average(:score).to_f
    end
  
    def reviews_count
      comments.count
    end
  end
  