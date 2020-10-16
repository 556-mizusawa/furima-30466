class Item < ApplicationRecord
  belongs_to :user

  validates :title,          presence: true
  validates :catch_copy,     presence: true
  validates :genre_id,       presence: true
  validates :status_id,      presence: true
  validates :delivery_id,    presence: true
  validates :prefecture_id,  presence: true
  validates :days_id,        presence: true
  validates :price,          presence: true
end
