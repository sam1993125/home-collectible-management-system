class ItemDetail < ApplicationRecord
    has_many :item_statuses, dependent: :destroy
    has_many :users, through: :item_statuses
end
