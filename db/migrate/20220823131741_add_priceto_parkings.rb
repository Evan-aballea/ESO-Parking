class AddPricetoParkings < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :price, :integer
  end
end
