class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

    PRICE_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
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

    validates :status_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }

    belongs_to :category
    belongs_to :prefecture
    belongs_to :shipping_cost
    belongs_to :shipping_day
    belongs_to :status
end
