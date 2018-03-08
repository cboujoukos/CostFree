class Category < ApplicationRecord
  has_many :activity_categories
  has_many :activities, through: :activity_categories
  has_many :profile_categories
  has_many :profiles, through: :profile_categories
  validates :title, presence: true, uniqueness: true

  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

  def self.popular_categories
    left_joins(:activities).group("id").order("count(activities.id) desc").limit(6)
  end
end



#def self.most_popular
#  joins(:reviews).group("activities.id").order("(sum(reviews.rating)/count(*)) desc")
#end
