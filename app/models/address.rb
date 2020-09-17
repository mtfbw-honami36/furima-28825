class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state

  with_options presence: true do
    validates :state, :city, :block_number, :purchase_id
    validates :PostalCode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :PhoneNumber,　format: { with: /\A\d{,11}\z/}
  end
  validates :state_id, numericality: { other_than: 1, message: 'Select' }
end
