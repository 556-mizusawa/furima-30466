class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre 
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_one :order
  has_one_attached :image

  #通常バリデーション 
  with_options presence: true do
    validates :image
    validates :title
    validates :catch_copy 
    validates :genre_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  #金額範囲のバリデーション 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  #ActiveHash_idバリデーション
  validates :genre_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id, numericality: { other_than: 0, message: "Select"} 
end

