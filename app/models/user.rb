class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
   validates :nick_name
   NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
   validates_format_of :family_name, with: NAME_REGEX
   validates_format_of :first_name, with: NAME_REGEX
   KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
   validates_format_of :family_name_kana, with: KANA_REGEX
   validates_format_of :first_name_kana, with: KANA_REGEX
   validates :birth_day
  end
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX
   has_many :purchases
end
