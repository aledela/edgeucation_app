class AddSubjectToSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :subject, :string
  end
end
