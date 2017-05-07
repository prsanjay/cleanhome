class Cleaner < ActiveRecord::Base
  has_many :bookings,:dependent => :destroy
  has_many :city_cleaners
  has_many :cities,through: :city_cleaners

  validates :first_name,:last_name,:email_id,:quality_score, presence: true

  validates :quality_score, inclusion: { in: 0.0..5.0,
    message: "should be between 0.0 and 5.0" }

  validates_format_of :email_id, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


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
