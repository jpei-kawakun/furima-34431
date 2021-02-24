class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nick_name, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_day, presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password,length:{minimum:6},with: PASSWORD_REGEX
  has_many :purchases
end
