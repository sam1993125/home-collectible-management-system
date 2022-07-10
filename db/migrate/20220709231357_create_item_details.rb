class CreateItemDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :item_details do |t|
      t.string :image_url
      t.string :object_name
      t.integer :object_year
      t.string :object_type
      t.text :object_description
      t.string :condition
      t.string :location
      t.string :bought_at

      t.timestamps
    end
  end
end
