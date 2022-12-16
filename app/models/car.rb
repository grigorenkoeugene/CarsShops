class Car < ApplicationRecord
  validates :make, :model, :year, :price, :odometer, presence: true
  validates :year, numericality: { less_than_or_equal_to: Time.now.year }
  validates :odometer, numericality: {greater_than: 0 }
  belongs_to :shop

  scope :bmw, -> { where(make: "bmw")} 

  after_create do 
    shop.cars_count += 1
    shop.save
  end

end
