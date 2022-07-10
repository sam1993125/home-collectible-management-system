class ItemStatus < ApplicationRecord
  belongs_to :item_detail
  belongs_to :user
end
