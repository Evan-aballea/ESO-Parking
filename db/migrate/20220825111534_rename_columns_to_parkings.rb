class RenameColumnsToParkings < ActiveRecord::Migration[7.0]
  def change
    rename_column(:parkings, :availability_date, :start_date)
    rename_column(:parkings, :availability_time, :end_date)
  end
end
