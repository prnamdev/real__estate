class Property < ApplicationRecord
  belongs_to :user

  has_many :interests, dependent: :destroy

  validates :title, :price, presence: true, length: { maximum: 50 }
  validates :property_size , presence: true
  validates :is_deposit_required , presence: true

  def interest_shown_by?(user)
    user_intreset(user).present?
  end

  def user_intreset(user)
    self.interests.find_by(user_id: user.id)
  end
end
