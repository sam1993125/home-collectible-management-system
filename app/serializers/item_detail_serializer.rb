class ItemDetailSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :object_name, :object_year, :object_type, :object_description, :condition, :location, :bought_at
end
