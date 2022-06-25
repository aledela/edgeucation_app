class AddLogoImageToCollege < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :logo_image, :string
  end
end
