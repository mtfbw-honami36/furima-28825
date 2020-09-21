class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :PostalCode, null: false
      t.integer :state_id, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.string :PhoneNumber, null: false
      t.integer :purchase_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
