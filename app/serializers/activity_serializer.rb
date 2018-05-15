class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :user
  has_many :reviews
  has_many :photos
end
