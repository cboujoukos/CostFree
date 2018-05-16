class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :comment, :updated_at
  belongs_to :activity
  belongs_to :user
end
