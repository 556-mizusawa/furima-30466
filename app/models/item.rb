class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :status, :delivery_fee, :prefecture, :day

  belongs_to :user
  has_one_attached :image

  #通常バリデーション 
  validates :title, :catch_copy, :genre, :status, :delivery_fee, :prefecture, :day, :price, presence: true
  
  #ActiveHash_idバリデーション
  validates :genre_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id, numericality: { other_than: 0 } 
end

