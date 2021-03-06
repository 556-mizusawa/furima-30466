class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"
  with_options presence: true do
    validates :nickname
    validates :birthday
    #名前 全角漢字、かな、カナ
    validates :last_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters."}
    #フリガナ 全角カタカナ
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
  end

  has_many :items
  has_many :orders
end
