class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.integer :genre_id, null:false
      t.integer :item_condition_id, null:false
      t.integer :shipping_cost_id, null: false
      t.integer :ship_from_id, null: false
      t.integer :delivery_days_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
