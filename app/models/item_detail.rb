class ItemDetail < ApplicationRecord
    has_many :item_statuses
    has_many :users, through: :item_statuses
end
