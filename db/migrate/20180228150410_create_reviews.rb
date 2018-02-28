class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.belongs_to :user
      t.belongs_to :activity

      t.timestamps
    end
  end
end
