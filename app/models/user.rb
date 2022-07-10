class User < ApplicationRecord
    has_many :item_statuses, dependent: :destroy
    has_many :item_details, through: :item_statuses
end
