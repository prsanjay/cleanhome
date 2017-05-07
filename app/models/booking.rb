class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner
  belongs_to :city

  validates :city_id,:booking_date,:booking_time, presence: true

  validate :cleaner_availability

  def cleaner_availability
    available_cleaners = Cleaner.joins('LEFT JOIN bookings on bookings.cleaner_id=cleaners.id',:city_cleaners).where('booking_date != ? OR booking_date IS NULL',self.booking_date).where('booking_time != ? OR booking_time IS NULL',self.booking_time).where('city_cleaners.city_id=?',self.city_id).uniq

      if available_cleaners.present?
          self.cleaner_id = available_cleaners.first.id
      else
        errors.add('', ': No Cleaner Available')
      end
  end
end
