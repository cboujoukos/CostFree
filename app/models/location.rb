class Location < ApplicationRecord
  has_many :activities
  accepts_nested_attributes_for :activities

  def activities_attributes=(activities_attributes)
    activities_attributes.each do |i, activity_attributes|
      if !activity_attributes[:title].blank? && !activity_attributes[:description].blank?
        self.activities.build(activity_attributes)
      end
    end
  end
end
