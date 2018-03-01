class RemoveRefFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:locations, :activity, index: true, foreign_key: true)
  end
end
