class CreateDrives < ActiveRecord::Migration[5.2]
  def change
    create_table :drives do |t|
      t.string :name
      t.string :state
      t.text :description
      t.float :bound_a_lng
      t.float :bound_a_lat
      t.float :bound_b_lng
      t.float :bound_b_lat

      t.timestamps
    end
  end
end
