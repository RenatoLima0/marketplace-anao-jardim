class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true
  validates :localization, presence: true
  validates :disponibility, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :description, presence: true

end
