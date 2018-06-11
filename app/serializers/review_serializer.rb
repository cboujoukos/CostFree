class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :comment, :updatedAt
  belongs_to :activity
  belongs_to :user

  def updatedAt
    object.updated_at
  end
end
