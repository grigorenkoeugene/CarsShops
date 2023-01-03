class User < ApplicationRecord
  has_many :cars

  PASSWORD_FORMAT = /\A
  (?=.{8,}) 
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  (?=.*[:])
/x

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, format: {with: /@/, message: "hasn't @"}, uniqueness: true
  validates :password, format: {with: PASSWORD_FORMAT}
end
