class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999, message: "is invalid"}



    belongs_to :user
    has_one :purchase
    has_one_attached :image
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    with_options presence: true do
     validates :status_id
     validates :category_id
     validates :shipping_cost_id
     validates :shipping_day_id
     validates :prefecture_id
     validates :image
    end
    
    with_options numericality: { other_than: 0 } do
     validates :status_id
     validates :category_id
     validates :shipping_cost_id
     validates :shipping_day_id
     validates :prefecture_id

    end


    belongs_to :category
    belongs_to :prefecture
    belongs_to :shipping_cost
    belongs_to :shipping_day
    belongs_to :status

end
