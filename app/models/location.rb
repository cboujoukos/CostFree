class Location < ApplicationRecord
  has_many :activities
  accepts_nested_attributes_for :activities


end
