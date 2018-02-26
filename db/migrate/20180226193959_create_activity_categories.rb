class CreateActivityCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_categories do |t|
      t.belongs_to :activity
      t.belongs_to :category
      t.timestamps
    end
  end
end
