class LocationSerializer < ActiveModel::Serializer
  attributes :id
  has_many :activities
  has_many :reviews, through: :activities

end
