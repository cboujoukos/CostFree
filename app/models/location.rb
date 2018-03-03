class Location < ApplicationRecord
  validates :street_address_1, presence: true
  has_many :activities
  accepts_nested_attributes_for :activities

  def format_city_and_state
    if city != "" && city != nil && state != "" && state != nil
      return "#{self.city}, #{self.state}"
    elsif city != ""
      return city
    elsif state != ""
      return state
    else
      return
    end
  end

  def activities_attributes=(activities_attributes)
    activities_attributes.each do |i, activity_attributes|
      if !activity_attributes[:title].blank? && !activity_attributes[:description].blank?
        if activity_attributes[:id].blank?
          self.activities.build(activity_attributes)
        else
          activity = Activity.find_by(id: activity_attributes[:id])
          activity.update(activity_attributes)
        end
      end
    end
  end
end
