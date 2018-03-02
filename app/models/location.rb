class Location < ApplicationRecord
  has_many :activities
  accepts_nested_attributes_for :activities

  def activities_attributes=(activities_attributes)
    activities_attributes.each do |key, value|
      if !value[:title].blank?
        activity = Activity.find_by(:id => value["id"]) || Activity.find_by(:title => value["title"]) || Activity.new
        activity.title = value["title"]
        activity.save
      end
    end
  end
end
