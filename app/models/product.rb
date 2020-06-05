class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :localization
  has_one :order, :dependent => :destroy

  after_validation :geocode, if: :will_save_change_to_localization?
  validates :title, presence: true
  validates :localization, presence: true
  validates :disponibility, presence: true, inclusion: { in: 1..100 }
  validates :price, presence: true, inclusion: { in: 1..10000000000000000 }
  validates :category, presence: true
  validates :description, presence: true

end
