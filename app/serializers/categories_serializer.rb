class CategoriesSerializer < ActiveModel::Serializer
  attributes :id, :title, :icon_file_name, :icon_content_type, :icon_file_size
end
