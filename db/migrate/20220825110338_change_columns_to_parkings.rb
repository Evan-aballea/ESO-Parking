class ChangeColumnsToParkings < ActiveRecord::Migration[7.0]
  def change
    change_column(:parkings, :availability_date, :string)
    change_column(:parkings, :availability_time, :string)
  end

  def rename
    rename_column(:parkings, :availability_date, :start_date)
    rename_column(:parkings, :availability_time, :end_date)
  end
end
