class Property < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 40}
  validates :rent, presence: true, length: { maximum: 20}
  validates :address, presence: true, length: { maximum: 60}
  validates :age, presence: true, length: { maximum: 20}
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true  #今回新たに学んだ方法
end
