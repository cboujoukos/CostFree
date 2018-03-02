class Location < ApplicationRecord
  has_many :activities
  accepts_nested_attributes_for :activities

  def activities_attributes=(activities_attributes)
    activities_attributes.each do |activity_attributes|
      if !activity_attributes.last[:title].blank? && !activity_attributes.last[:description].blank?
        self.activities.build(activity_attributes.last)
      end
    end
  end
end
