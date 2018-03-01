class AddLocationRefToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :location, foreign_key: true
  end
end
