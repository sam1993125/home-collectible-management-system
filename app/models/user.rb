class User < ApplicationRecord
    has_many :item_statuses
    has_many :item_details, through: :item_statuses
end
