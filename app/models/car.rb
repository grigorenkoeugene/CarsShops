class Car < ApplicationRecord
  validates :make, :model, :year, :price, presence: true
  validates :year, numericality: { less_than_or_equal_to: Time.now.year }
end
