class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :nick_name
    validates :nick_name
    validates :nick_name
    validates :nick_name
    validates :nick_name
    validates :nick_name
    validates :nick_name
  end

    belongs_to :user
    has_one :purchase
end
