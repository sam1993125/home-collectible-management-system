class ItemStatusSerializer < ActiveModel::Serializer
  attributes :id, :selling_or_donating, :is_shipped, :report_date

end
