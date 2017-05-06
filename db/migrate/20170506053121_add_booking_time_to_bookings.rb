class AddBookingTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_time, :string
  end
end
