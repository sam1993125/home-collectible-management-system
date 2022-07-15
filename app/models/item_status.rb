class ItemStatus < ApplicationRecord
  belongs_to :item

   validates :report_date, presence: true
  


end
