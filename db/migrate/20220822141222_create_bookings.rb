class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parking, null: false, foreign_key: true
      t.datetime :arrival
      t.datetime :depart

      t.timestamps
    end
  end
end
