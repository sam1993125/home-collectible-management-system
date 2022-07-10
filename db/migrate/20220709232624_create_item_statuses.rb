class CreateItemStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :item_statuses do |t|
      t.belongs_to :item_detail, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :selling_or_donating
      t.float :price_for_selling
      t.boolean :is_shipped
      t.boolean :has_invoice

      t.timestamps
    end
  end
end
