class City < ActiveRecord::Base
  has_many :bookings
  has_many :city_cleaners
  has_many :cleaners,through: :city_cleaners
end
