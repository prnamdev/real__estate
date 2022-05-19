class Property < ApplicationRecord
  has_many :clients
  belongs_to :user
end
