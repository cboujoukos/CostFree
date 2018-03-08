class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_categories
  has_many :categories, through: :profile_categories

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_161d7a8c2e4%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_161d7a8c2e4%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.3515625%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
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
