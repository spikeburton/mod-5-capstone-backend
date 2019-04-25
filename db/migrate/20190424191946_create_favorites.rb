class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :drive, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [ :user_id, :drive_id ], unique: true
  end
end
