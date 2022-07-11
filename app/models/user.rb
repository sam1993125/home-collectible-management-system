class User < ApplicationRecord
    has_secure_password

    has_many :item_statuses, dependent: :destroy
    has_many :item_details, through: :item_statuses

    validates :username, presence: true, uniqueness: true
end
