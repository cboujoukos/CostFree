class AddLocationRefToActivitiesTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :location
  end
end
