class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :phone_number, :building_name, :address, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token

  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building_name: building_name, address: address, purchase_id: purchase.id)
  end

end