class Customer < ActiveRecord::Base

  has_many :bookings

  accepts_nested_attributes_for :bookings

  def self.create_booking_and_customer(customer_params)
    where(phone_number: customer_params[:phone_number]).first_or_create do |customer|
      customer.first_name = customer_params[:first_name]
      customer.last_name = customer_params[:last_name]
      customer.phone_number = customer_params[:phone_number]
      customer.save!
      @customer = customer
    end
    booking = Booking.create_if_cleaners_available(customer_params[:bookings_attributes]["0"],@customer.id)
    if booking == false
      return {:error => "Booking Not Available", :customer => @customer}
    else
      return {:error => nil, :customer => @customer}
    end
  end
end
