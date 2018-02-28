class Category < ApplicationRecord
  has_many :activity_categories
  has_many :activities, through: :activity_categories
  validates :title, presence: true, uniqueness: true

  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "question-mark.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
