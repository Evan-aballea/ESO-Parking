class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :height
      t.string :width
      t.string :length
      t.text :description
      t.string :pass_code
      t.date :availability_date
      t.time :availability_time

      t.timestamps
    end
  end
end
