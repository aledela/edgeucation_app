class CreateCollegeMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :college_majors do |t|
      t.references :college, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true

      t.timestamps
    end
  end
end
