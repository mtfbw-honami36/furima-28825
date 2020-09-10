class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  
  belongs_to_active_hash :genre
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :delivery_day
  
  has_one_attached :image

  validates :name, :text, :genre, :item_condition, :shipping_cost, :ship_from, :delivery_day, presence: true
  validates :genre_id, :item_condition_id, :shipping_cost_id, :ship_from_id, :delivery_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true }, length: { is: 300..9,999,999 }
end
