class AddConfirmationToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :confirmation, :boolean, default: false
  end
end
