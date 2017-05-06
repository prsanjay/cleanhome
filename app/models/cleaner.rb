class Cleaner < ActiveRecord::Base
  has_many :bookings,:dependent => :destroy
  has_many :city_cleaners
  has_many :cities,through: :city_cleaners

  validates :first_name,:last_name,:email_id, presence: true

  def add_cities(cities)
    CityCleaner.where(cleaner_id: self.id).destroy_all
    cities.each do |city|
      CityCleaner.create(city_id: city,cleaner_id: self.id)
    end
  end

  def name
    return "#{first_name} #{last_name}"
  end
end
