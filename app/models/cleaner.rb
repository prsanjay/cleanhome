class Cleaner < ActiveRecord::Base
  has_many :bookings
  has_many :city_cleaners
  has_many :cities,through: :city_cleaners
end
