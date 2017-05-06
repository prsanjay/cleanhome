class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner
  belongs_to :city

  def self.create_if_cleaners_available(booking_params,customer_id)
    customer = Customer.find(customer_id)
    cleaners = Cleaner.joins(:bookings,:city_cleaners).where('booking_date != ?',booking_params[:booking_date].to_date).where('bookings.booking_time != ?',booking_params[:booking_time]).where('city_cleaners.city_id IN (?)',booking_params[:city_id])
    if cleaners.present?
        booking = Booking.create(cleaner_id: cleaners.first.id,customer_id: customer_id,city_id: booking_params[:city_id],booking_date: booking_params[:booking_date],time: booking_params[:booking_time])
    else
      return false
    end
  end
end
