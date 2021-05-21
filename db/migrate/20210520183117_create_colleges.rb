class CreateColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :colleges do |t|
      t.string :coll_name
      t.string :zip_code
      t.string :cost_att

      t.timestamps
    end
  end
end
