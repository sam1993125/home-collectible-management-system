class Item < ApplicationRecord
    belongs_to :user
    has_many :item_statuses, dependent: :destroy
   
    validates :image_url, presence: true
    validates :object_name, presence: true
    validates :object_year, presence: true
    validates :object_type, presence: true
    validates :condition, presence: true
    validates :bought_at, presence: true
end
