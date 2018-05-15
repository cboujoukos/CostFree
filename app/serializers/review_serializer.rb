class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  belongs_to :activity
  belongs_to :user
end
