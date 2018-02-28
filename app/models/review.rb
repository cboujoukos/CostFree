class Review < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates_presence_of :rating
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: 1..5
  validates_presence_of :comment
end
