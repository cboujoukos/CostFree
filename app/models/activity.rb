class Activity < ApplicationRecord
  has_many :activity_categories
  has_many :categories, through: :activity_categories

  validates_presence_of :title
  validates_presence_of :description
end
