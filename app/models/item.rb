class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates_format_of :price, with: PRICE_REGEX, greater_than: 300, less_than: 99999999

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
    end
    
    with_options numericality: { other_than: 1 } do
     validates :status_id
     validates :category_id
     validates :shipping_cost_id
     validates :shipping_day_id
    end


    belongs_to :category
    belongs_to :prefecture
    belongs_to :shipping_cost
    belongs_to :shipping_day
    belongs_to :status

end
