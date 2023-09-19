class User < ApplicationRecord
  has_many :transactions
  has_many :categories
  validates :name, presence: true
end
