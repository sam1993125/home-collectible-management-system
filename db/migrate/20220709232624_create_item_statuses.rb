class CreateItemStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :item_statuses do |t|
      t.integer :item_id
      t.integer :user_id
      t.boolean :selling_or_donating
      t.datetime :report_date
      t.boolean :is_shipped

      t.timestamps
    end
  end
end
