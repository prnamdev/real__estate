class Property < ApplicationRecord
  belongs_to :user
  has_many :interests, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :property_size , presence: true
  validates :price, presence: true, length: { maximum: 50 }
  validates :is_deposit_required , presence: true
end
