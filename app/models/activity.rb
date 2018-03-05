class Activity < ApplicationRecord
  has_many :activity_categories
  has_many :categories, through: :activity_categories
  has_many :reviews
  belongs_to :location, optional: true

  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description

  def location_attributes=(location_attributes)
    self.build_location(location_attributes)
  end

  def self.most_popular
    joins(:reviews).group("activities.id").order("(sum(reviews.rating)/count(*)) desc")
  end

  def self.no_reviews
    Activity.includes(:reviews).where( :reviews => { :id => nil } )
  end

  def self.first_twelve
    Activity.limit(12)
  end
end
