class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to_active_hash :genre
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :delivery_day

  has_one_attached :image

  with_options presence: true do
  validates :name, :text, :genre, :item_condition, :shipping_cost, :ship_from, :delivery_day,:image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :genre_id, :item_condition_id, :shipping_cost_id, :ship_from_id, :delivery_day_id, numericality: { other_than: 1, message: 'Select' }

end
