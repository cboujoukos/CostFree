class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :suggested_duration

      t.timestamps
    end
  end
end
