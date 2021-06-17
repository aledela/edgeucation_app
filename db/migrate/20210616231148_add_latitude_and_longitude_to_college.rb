class AddLatitudeAndLongitudeToCollege < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :latitude, :float
    add_column :colleges, :longitude, :float
  end
end
