class Car < ApplicationRecord
  validates :make, :model, :year, :price, :odometer, presence: true
  validates :year, numericality: { less_than_or_equal_to: Time.now.year }
  validates :odometer, numericality: {greater_than: 0 }
  belongs_to :shop
  belongs_to :user 

  after_create do 
    shop.cars_count += 1
    shop.save 
  end

  after_destroy do 
    shop.cars_count -= 1
    shop.save
  end
 
end
