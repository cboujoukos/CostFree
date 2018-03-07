class CreatePhotos < ActiveRecord::Migration[5.1]
  def up
    create_table :photos do |t|
      t.string :description
      t.attachment :image

      t.timestamps
    end
  end
  def down
    drop_table :photos
  end
end
