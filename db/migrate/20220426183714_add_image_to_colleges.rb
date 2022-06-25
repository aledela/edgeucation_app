class AddImageToColleges < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :image, :string
  end
end
