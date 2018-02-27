class AddIconToColumnToCategory < ActiveRecord::Migration[5.1]
  def up
    add_attachment :categories, :icon
  end

  def down
    remove_attachment :categories, :icon
  end
end
