class Article < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :url, :presence => true, :uniqueness => true

  def average_rating
    ratings.average(:value)
  end
end
