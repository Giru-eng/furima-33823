class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_form_area
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :prefecture_id
      validates :ship_form_area_id
      validates :days_to_ship_id
    end
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
  end
end
