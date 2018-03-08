class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_categories
  has_many :categories, through: :profile_categories

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      if category_attributes[:id] != ""
        category = Category.find_by(id: category_attributes[:id])
        if !self.categories.include?(category)
          self.profile_categories.build(
            :profile_id => self.id,
            :category_id => category.id,
            :rating => category_attributes[:rating]
          )
        end
      end
    end
  end
end
