class ChangeColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :depart, :string
    change_column :bookings, :arrival, :string
  end

  def change
    rename_column :bookings, :depart, :booking_start
    rename_column :bookings, :arrival, :booking_end
  end
end
