class CreateProfileCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :profile_categories do |t|
      t.references :profile, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end

  def down
    drop_table :profile_categories
  end
end
