class User < ApplicationRecord
    has_secure_password

    has_many :items
    has_many :item_statuses, through: :items

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true
    validates :user_type, inclusion: { in: %w(Individual Family), message: "must be either Family or Individual"}

end
