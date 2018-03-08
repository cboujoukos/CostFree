class ProfileCategory < ApplicationRecord
  belongs_to :profile
  belongs_to :category

  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: 1..5
end
