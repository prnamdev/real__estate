class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: { broker: 0, client: 1}

  has_many :properties, dependent: :destroy
  has_many :interests,  dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: {
    maximum: 255
  }, format: {
    with: VALID_EMAIL_REGEX
  }, uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }
end
