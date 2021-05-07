class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :item_purchase_id, :token
  with_options presence: true do
    validates :city
    validates :address
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only 10 or 11 half-width numbers'}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    ShippingLocation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
 end