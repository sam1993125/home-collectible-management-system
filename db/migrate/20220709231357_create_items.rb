class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :image_url
      t.string :object_name
      t.integer :object_year
      t.string :object_type
      t.text :object_description
      t.string :condition
      t.string :location
      t.string :bought_at
      t.boolean :has_invoice

      t.timestamps
    end
  end
end
