class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :price, :postalCode, :state_id, :city, :block_number, :building_name, :phoneNumber, :user_id, :item_id

  with_options presence: true do
    validates :city, :block_number, :token, :price
    validates :postalCode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phoneNumber, format: { with: /\A\d{1,11}\z/ }
    validates :state_id, numericality: { other_than: 1, message: 'Select' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(PostalCode: postalCode, state_id: state_id, city: city, block_number: block_number, building_name: building_name, PhoneNumber: phoneNumber, purchase_id: purchase.id)
    Item.find(item_id).update(purchaser_id: user_id)
  end
end
