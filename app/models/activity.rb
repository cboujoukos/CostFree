class Activity < ApplicationRecord
  has_many :activity_categories
  has_many :categories, through: :activity_categories
  has_many :reviews
  belongs_to :location, optional: true

  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description
end
