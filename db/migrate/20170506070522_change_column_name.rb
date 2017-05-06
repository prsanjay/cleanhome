class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :bookings, :date, :booking_date
  end
end
