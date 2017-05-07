class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner
  belongs_to :city

  validates :city_id,:booking_date,:booking_time, presence: true

  validate :cleaner_availability

  def cleaner_availability
    taken_cleaners = Cleaner.joins("LEFT JOIN bookings on bookings.cleaner_id=cleaners.id",:city_cleaners).where('city_cleaners.city_id IN (?) AND booking_date=? AND booking_time=?',self.city_id,self.booking_date,self.booking_time).uniq

      available_cleaners = Cleaner.all - taken_cleaners
      if available_cleaners.present?
          self.cleaner_id = available_cleaners.first.id
      else
        errors.add('', ': No Cleaner Available')
      end
  end
end
