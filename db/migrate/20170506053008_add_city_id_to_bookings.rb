class AddCityIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :city_id, :integer
    add_index :bookings, :city_id
  end
end
