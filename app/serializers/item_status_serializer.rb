class ItemStatusSerializer < ActiveModel::Serializer
  attributes :id, :selling_or_donating, :price_for_selling, :is_shipped, :has_invoice
  has_one :item_detail
  has_one :user
end
