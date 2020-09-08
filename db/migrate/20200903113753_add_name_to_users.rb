class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kanji_last_name, :string, null: false
    add_column :users, :kanji_first_name, :string, null: false
    add_column :users, :kana_last_name, :string, null: false
    add_column :users, :kana_first_name, :string, null: false
  end
end
