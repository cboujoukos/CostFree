class AddUserAndActivityToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :user, foreign_key: true
    add_reference :photos, :activity, foreign_key: true
  end
end
