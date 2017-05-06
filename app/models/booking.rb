class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner

  def self.create_if_cleaners_available(booking_params,customer_id)
    customer = customer.find(customer_id)
    cleaners = Cleaner.joins(:bookings,:city_cleaners).where('city_id IN (?) && date != and timer !=',booking_params[:city_id],booking_params[:date].to_date,booking_params[:time])
    if cleaners.present?
        booking = Booking.create(cleaner_id: cleaners.first.id,customer_id: customer_id,city_id: booking_params[:city_id])
    else
      customer.errors.add(:base, "No Cleaner Available")
    end
  end
end
