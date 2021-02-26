class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nick_name, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true 
         NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
         validates_format_of :family_name, with: NAME_REGEX
         validates_format_of :first_name, with: NAME_REGEX
         validates :family_name_kana, presence: true 
         validates :first_name_kana, presence: true 
         KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
         validates_format_of :family_name_kana, with: KANA_REGEX
         validates_format_of :first_name_kana, with: KANA_REGEX
         validates :birth_day, presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX
  has_many :purchases
end
